import 'package:code_builder/code_builder.dart' as code;

import '../spec/openapi.dart';
import '../spec/shared.dart';
import 'json_schema.dart';
import 'store.dart';
import 'utils.dart';

List<code.Method> generatePathItem(String path, PathItem pathItem) {
  // generate a method for each operation
  final methods = <code.Method>[];
  final docs = docsFrom(
    summary: pathItem.summary,
    description: pathItem.description,
  );

  final pathParts = (path.startsWith('/') ? path.substring(1) : path).split(
    '/',
  );

  if (pathItem.get case final getOp?) {
    methods.add(
      generateOperation(
        getOp,
        parameters: pathItem.parameters,
        docs: docs,
        altName: toCamelCase([...pathParts, 'get']),
        opKind: OperationKind.get,
        pathname: path,
      ),
    );
  }

  if (pathItem.post case final postOp?) {
    methods.add(
      generateOperation(
        postOp,
        parameters: pathItem.parameters,
        docs: docs,
        altName: toCamelCase([...pathParts, 'post']),
        opKind: OperationKind.post,
        pathname: path,
      ),
    );
  }

  if (pathItem.put case final putOp?) {
    methods.add(
      generateOperation(
        putOp,
        parameters: pathItem.parameters,
        docs: docs,
        altName: toCamelCase([...pathParts, 'put']),
        opKind: OperationKind.put,
        pathname: path,
      ),
    );
  }

  if (pathItem.delete case final deleteOp?) {
    methods.add(
      generateOperation(
        deleteOp,
        parameters: pathItem.parameters,
        docs: docs,
        altName: toCamelCase([...pathParts, 'delete']),
        opKind: OperationKind.delete,
        pathname: path,
      ),
    );
  }

  if (pathItem.options case final optionsOp?) {
    methods.add(
      generateOperation(
        optionsOp,
        parameters: pathItem.parameters,
        docs: docs,
        altName: toCamelCase([...pathParts, 'options']),
        opKind: OperationKind.options,
        pathname: path,
      ),
    );
  }

  if (pathItem.head case final headOp?) {
    methods.add(
      generateOperation(
        headOp,
        parameters: pathItem.parameters,
        docs: docs,
        altName: toCamelCase([...pathParts, 'head']),
        opKind: OperationKind.head,
        pathname: path,
      ),
    );
  }

  if (pathItem.patch case final patchOp?) {
    methods.add(
      generateOperation(
        patchOp,
        parameters: pathItem.parameters,
        docs: docs,
        altName: toCamelCase([...pathParts, 'patch']),
        opKind: OperationKind.patch,
        pathname: path,
      ),
    );
  }

  if (pathItem.trace case final traceOp?) {
    methods.add(
      generateOperation(
        traceOp,
        parameters: pathItem.parameters,
        docs: docs,
        altName: toCamelCase([...pathParts, 'get']),
        opKind: OperationKind.trace,
        pathname: path,
      ),
    );
  }

  return methods;
}

code.Method generateOperation(
  Operation operation, {
  List<TypeOrReference<Parameter>>? parameters,
  String? docs,
  String? altName,
  required String pathname,
  required OperationKind opKind,
}) {
  final opDocs =
      docsFrom(
        summary: operation.summary,
        description: operation.description,
      ) ??
      docs;

  final params = [
    ...?operation.parameters,
    ...?parameters,
  ].map((p) => p.resolveJson(openApiJson));

  final name = operation.operationId ?? altName;
  assert(
    name != null,
    "Could not get name for method from `operationId` or from `altName`",
  );

  // TODO: SSE
  return code.Method((m) {
    // TODO: Throws
    // TODO: Result response
    m
      ..name = name
      ..docs.addAll([
        '/// $opKind $pathname',
        '/// ======================',
        ...?opDocs?.split('\n'),
      ])
      ..optionalParameters.addAll(params.map(generateParameter));

    if (operation.requestBody?.resolveJson(
          openApiJson,
          resolutionObject: resolvedComponentsObject,
        )
        case final resolvedRequestObject?) {
      final MapEntry(key: contentType, value: contentMediaType) =
          resolvedRequestObject.content.entries.first;
      final requestBodySchema = contentMediaType.schema?.resolveJson(
        openApiJson,
        resolutionObject: resolvedComponentsObject,
      );
      m.requiredParameters.add(
        code.Parameter(
          (p) => p
            ..name = 'body'
            ..type = switch (contentType) {
              // TODO: Streamed Content
              'application/octet-stream' => code.refer('StreamedContent'),
              'application/x-tar' ||
              'application/gzip' => code.refer('StreamedContent'),
              _ =>
                requestBodySchema != null
                    ? generateSchemaType(requestBodySchema)
                    : code.refer('dynamic'),
            },
        ),
      );
    }

    // Generate schema types for ALL responses to ensure they're available
    // for error handling and other uses, not just the main success response
    void generateResponseSchemas(TypeOrReference<Response> responseRef) {
      final response = responseRef.resolveJson(
        openApiJson,
        resolutionObject: resolvedComponentsObject,
      );
      if (response.content case final responseContent?) {
        for (final contentEntry in responseContent.entries) {
          final responseMediaType = contentEntry.value;
          final schemaObject = responseMediaType.schema?.resolveJson(
            openApiJson,
            resolutionObject: resolvedComponentsObject,
          );
          if (schemaObject != null) {
            // This call ensures the schema type gets generated and stored
            generateSchemaType(schemaObject);
          }
        }
      }
    }

    // Generate types for default response
    if (operation.responses.defaultResponse case final defaultResponse?) {
      generateResponseSchemas(defaultResponse);
    }

    // Generate types for all status code responses
    if (operation.responses.statusCodeResponses case final statusResponses?) {
      for (final responseRef in statusResponses.values) {
        generateResponseSchemas(responseRef);
      }
    }

    // TODO: bug: We only make use of the main response or 200 response for
    //  the return type of the method because Dart doesn't have an awesome way
    //  of working with multiple types
    final mainResponse =
        (operation.responses.defaultResponse ??
                operation.responses.statusCodeResponses?.entries
                    .where((e) => e.key.startsWith('2'))
                    .first
                    .value)
            ?.resolveJson(
              openApiJson,
              resolutionObject: resolvedComponentsObject,
            );
    if (mainResponse != null) {
      if (mainResponse.content case final mainResponseContent?) {
        final MapEntry(key: responseSchemaType, value: responseMediaType) =
            mainResponseContent.entries.first;

        final schemaObject = responseMediaType.schema?.resolveJson(
          openApiJson,
          resolutionObject: resolvedComponentsObject,
        );

        if (responseSchemaType == 'text/event-stream') {
          m.returns = code.TypeReference((t) {
            // TODO: We assume text/event-stream to be SSE events
            t
              ..symbol = 'Stream'
              ..types.add(switch (responseSchemaType) {
                _ =>
                  schemaObject != null
                      ? generateSchemaType(schemaObject)
                      : code.refer('dynamic'),
              });
          });
        } else {
          m.returns = code.TypeReference((t) {
            t
              ..symbol = 'FutureOr'
              ..url = 'dart:async'
              ..types.add(switch (responseSchemaType) {
                // TODO: Streamed Content
                _ =>
                  schemaObject != null
                      ? generateSchemaType(schemaObject)
                      : code.refer('dynamic'),
              });
          });
        }

        // assemble
      }
    } else {
      m.returns = code.refer('FutureOr<void>', 'dart:async');
    }
  });
}

code.Parameter generateParameter(Parameter param) {
  final paramTypeSchema = param.schema?.resolveJson(
    openApiJson,
    resolutionObject: resolvedComponentsObject,
  );
  return code.Parameter((p) {
    p
      ..name = param.name
      ..named = true
      ..required = param.required && !param.allowEmptyValue
      ..annotations.addAll([if (param.deprecated) code.refer('deprecated')])
      ..docs.add('/// Located in: **${param.location}**')
      ..type = paramTypeSchema != null
          ? generateSchemaType(paramTypeSchema)
          : code.refer('dynamic');

    if (param.description case final description?) {
      p.docs.addAll(['///', '/// $description']);
    }
  });
}

enum OperationKind {
  get,
  post,
  put,
  delete,
  options,
  head,
  patch,
  trace;

  @override
  String toString() {
    return name.toUpperCase();
  }
}
