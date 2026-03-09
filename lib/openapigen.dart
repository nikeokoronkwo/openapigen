import 'dart:convert';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

import 'src/generator/methods.dart';
import 'src/generator/registry.dart';
import 'src/generator/store.dart';
import 'src/generator/utils.dart';
import 'src/spec/openapi.dart';

Future<OpenAPI> parseOpenAPI(
  String path, {
  FileSystem fs = const LocalFileSystem(),
  Logger? logger,
}) async {
  logger ??= Logger.root;
  logger.info('Parsing OpenAPI spec from path: $path');

  // read file contents
  if (!fs.isFileSync(path)) {
    throw Exception('Could not find the given file at path: $path');
  }

  final file = fs.file(path);
  final openapiContents = await file.readAsString();

  final openapiSpecExtension = p.extension(path);

  if (openapiSpecExtension == '.json') {
    return OpenAPI.fromJson(jsonDecode(openapiContents));
  } else if (openapiSpecExtension == '.yaml') {
    return checkedYamlDecode(openapiContents, (m) => OpenAPI.fromJson(m!));
  } else {
    throw Exception(
      'Unexpected OpenAPI spec file format: $openapiSpecExtension. '
      'Only supported formats are: JSON, YAML',
    );
  }
}

String generateSchemaFromOpenAPI(
  OpenAPI openapi, {
  String? interfaceName,
  required String outputFile,
}) {
  /// Convert to json once
  openApiJson = openapi.toJson();

  final clientName =
      interfaceName ??
      openapi.info.title.splitMapJoin(RegExp(r'\w'), onMatch: (m) => '');

  // generate for all methods
  final methods = openapi.paths.entries.map((entry) {
    return generatePathItem(entry.key, entry.value);
  }).flattenedToList;

  final docs = docsFrom(
    summary: '''# ${openapi.info.title} v${openapi.info.version}
License Info: ${openapi.info.license?.name ?? 'None'} (${openapi.info.license?.url})''',
    description: openapi.info.description,
  );

  // fetch all generations for classes and enums
  final generatedClasses = componentsStore.values;
  final generatedEnums = enumsStore.values;

  final clientClass = Class(
    (c) => c
      ..abstract = true
      ..modifier = ClassModifier.interface
      ..name = '${clientName}Interface'
      ..docs.addAll([if (docs case final doc?) doc])
      ..methods.addAll(methods),
  );

  final lib = Library(
    (l) => l
      ..ignoreForFile.addAll([
        'non_constant_identifier_names',
        'directives_ordering',
        'constant_identifier_names',
        'package_access',
      ])
      ..directives.add(
        Directive.import('package:json_annotation/json_annotation.dart'),
      )
      ..directives.add(
        Directive.part(
          p.basename(outputFile).contains('.dart')
              ? p.basename(outputFile).replaceAll('.dart', '.g.dart')
              : '${p.basename(outputFile)}.g.dart',
        ),
      )
      ..body.addAll([
        ...baseClasses,
        ...generatedEnums,
        ...generatedClasses,
        clientClass,
      ]),
  );

  return DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  ).format(
    '${lib.accept(DartEmitter.scoped(useNullSafetySyntax: true, orderDirectives: true))}',
  );
}
