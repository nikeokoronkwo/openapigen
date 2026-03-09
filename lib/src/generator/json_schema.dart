import 'package:code_builder/code_builder.dart' as code;
import 'package:collection/collection.dart';

import '../spec/json_schema.dart';
import 'store.dart';

code.Reference generateSchemaType(
  Schema schema, {
  bool? isNullable,
  String? altName,
}) {
  /// Check if it is in store
  if (componentsStore[schema] case final codeClass?) {
    return code.TypeReference(
      (t) => t
        ..symbol = codeClass.name
        ..isNullable = isNullable ?? false,
    );
  } else if (enumsStore[schema] case final codeClass?) {
    return code.TypeReference(
      (t) => t
        ..symbol = codeClass.name
        ..isNullable = isNullable ?? false,
    );
  }

  isNullable ??= false;
  isNullable |= schema.nullable;

  final title =
      schema.title ?? altName ?? 'AnonymousObject${anonymousCounter++}';

  // check schema type
  switch (schema.type) {
    case SchemaType.nullValue:
      return code.refer('void');
    case SchemaType.number:
      return code.TypeReference(
        (t) => t
          ..symbol = 'num'
          ..isNullable = isNullable,
      );
    case SchemaType.string:
      if (schema.jsonSchemaEnum != null) {
        // enum of string values
        final enumValues = schema.jsonSchemaEnum!.map((v) => v.toString());

        final schemaEnum = enumsStore.putIfAbsent(schema, () {
          return code.Enum(
            (e) => e
              ..name = title
              ..values.addAll(
                enumValues.map((v) => v.toString()).map((v) {
                  return code.EnumValue(
                    (val) => val
                      ..name = v.startsWith(RegExp(r'\d')) ? '\$$v' : v
                      ..arguments.add(code.literalString(v)),
                  );
                }),
              )
              ..annotations.add(
                code.refer('JsonEnum').call([], {
                  'valueField': code.literalString('value'),
                }),
              )
              ..constructors.add(
                code.Constructor(
                  (c) => c
                    ..constant = true
                    ..requiredParameters.add(
                      code.Parameter(
                        (p) => p
                          ..name = 'value'
                          ..toThis = true,
                      ),
                    ),
                ),
              )
              ..fields.add(
                code.Field(
                  (f) => f
                    ..name = 'value'
                    ..modifier = code.FieldModifier.final$
                    ..type = code.refer('String'),
                ),
              ),
          );
        });

        return code.TypeReference(
          (t) => t
            ..symbol = schemaEnum.name
            ..isNullable = isNullable,
        );
      } else {
        return code.TypeReference(
          (t) => t
            ..symbol = 'String'
            ..isNullable = isNullable,
        );
      }
    case SchemaType.integer:
      if (schema.jsonSchemaEnum != null &&
          schema.jsonSchemaEnum!.every((v) => v is int)) {
        // enum of integer values
        final enumValues = schema.jsonSchemaEnum!.whereType<int>();

        final schemaEnum = enumsStore.putIfAbsent(schema, () {
          return code.Enum(
            (e) => e
              ..name = title
              ..values.addAll(
                enumValues.whereType<int>().map((v) {
                  return code.EnumValue(
                    (val) => val
                      ..name = '\$$v'
                      ..arguments.add(code.literalNum(v)),
                  );
                }),
              )
              ..annotations.add(
                code.refer('JsonEnum').call([], {
                  'valueField': code.literalString('value'),
                }),
              )
              ..constructors.add(
                code.Constructor(
                  (c) => c
                    ..constant = true
                    ..requiredParameters.add(
                      code.Parameter(
                        (p) => p
                          ..name = 'value'
                          ..toThis = true,
                      ),
                    ),
                ),
              )
              ..fields.add(
                code.Field(
                  (f) => f
                    ..name = 'value'
                    ..modifier = code.FieldModifier.final$
                    ..type = code.refer('int'),
                ),
              ),
          );
        });

        return code.TypeReference(
          (t) => t
            ..symbol = schemaEnum.name
            ..isNullable = isNullable,
        );
      } else {
        return code.TypeReference(
          (t) => t
            ..symbol = 'int'
            ..isNullable = isNullable,
        );
      }
    case SchemaType.boolean:
      return code.TypeReference(
        (t) => t
          ..symbol = 'bool'
          ..isNullable = isNullable,
      );
    case SchemaType.array:
      // array
      if (schema.items?.resolveJson(
            openApiJson,
            resolutionObject: resolvedComponentsObject,
          )
          case final items?) {
        return code.TypeReference(
          (t) => t
            ..symbol = 'List'
            ..isNullable = isNullable ?? false
            ..types.add(generateSchemaType(items, altName: '${title}Item')),
        );
      } else if (schema.prefixItems case final prefixItems?) {
        if (prefixItems.singleOrNull?.resolveJson(
              openApiJson,
              resolutionObject: resolvedComponentsObject,
            )
            case final singlePrefix?) {
          return code.TypeReference(
            (t) => t
              ..symbol = 'List'
              ..isNullable = isNullable
              ..types.add(
                generateSchemaType(singlePrefix, altName: '${title}Item'),
              ),
          );
        } else {
          return code.TypeReference(
            (t) => t
              ..symbol = 'List'
              ..isNullable = isNullable,
          );
        }
      } else {
        return code.TypeReference(
          (t) => t
            ..symbol = 'List'
            ..isNullable = isNullable,
        );
      }
    case null when schema.jsonSchemaEnum?.every((v) => v is int) ?? false:
      // enum of integer values
      final enumValues = schema.jsonSchemaEnum!.whereType<int>();

      final schemaEnum = enumsStore.putIfAbsent(schema, () {
        return code.Enum(
          (e) => e
            ..name = title
            ..values.addAll(
              enumValues.whereType<int>().map((v) {
                return code.EnumValue(
                  (val) => val
                    ..name = '\$$v'
                    ..arguments.add(code.literalNum(v)),
                );
              }),
            )
            ..annotations.add(
              code.refer('JsonEnum').call([], {
                'valueField': code.literalString('value'),
              }),
            )
            ..constructors.add(
              code.Constructor(
                (c) => c
                  ..constant = true
                  ..requiredParameters.add(
                    code.Parameter(
                      (p) => p
                        ..name = 'value'
                        ..toThis = true,
                    ),
                  ),
              ),
            )
            ..fields.add(
              code.Field(
                (f) => f
                  ..name = 'value'
                  ..modifier = code.FieldModifier.final$
                  ..type = code.refer('int'),
              ),
            ),
        );
      });

      return code.TypeReference(
        (t) => t
          ..symbol = schemaEnum.name
          ..isNullable = isNullable,
      );
    case null when schema.jsonSchemaEnum != null:
      // enum of string values
      final enumValues = schema.jsonSchemaEnum!.map((v) => v.toString());

      final schemaEnum = enumsStore.putIfAbsent(schema, () {
        // cast to string
        return code.Enum(
          (e) => e
            ..name = title
            ..values.addAll(
              enumValues.map((v) => v.toString()).map((v) {
                return code.EnumValue(
                  (val) => val
                    ..name = v.startsWith(RegExp(r'\d')) ? '\$$v' : v
                    ..arguments.add(code.literalString(v)),
                );
              }),
            )
            ..annotations.add(
              code.refer('JsonEnum').call([], {
                'valueField': code.literalString('value'),
              }),
            )
            ..constructors.add(
              code.Constructor(
                (c) => c
                  ..constant = true
                  ..requiredParameters.add(
                    code.Parameter(
                      (p) => p
                        ..name = 'value'
                        ..toThis = true,
                    ),
                  ),
              ),
            )
            ..fields.add(
              code.Field(
                (f) => f
                  ..name = 'value'
                  ..modifier = code.FieldModifier.final$
                  ..type = code.refer('String'),
              ),
            ),
        );
      });

      return code.TypeReference(
        (t) => t
          ..symbol = schemaEnum.name
          ..isNullable = isNullable,
      );
    case null
        when schema.oneOf?.every((v) {
              final oneOfSchema = v.resolveJson(
                openApiJson,
                resolutionObject: resolvedComponentsObject,
              );
              return oneOfSchema.jsonSchemaEnum?.isNotEmpty ?? false;
            }) ??
            false:
      // composed enum
      final enumValues = schema.oneOf!.fold([], (prev, next) {
        final resolvedSchema = next.resolveJson(
          openApiJson,
          resolutionObject: resolvedComponentsObject,
        );
        return [...prev, ...?resolvedSchema.jsonSchemaEnum];
      });

      final schemaEnum = enumsStore.putIfAbsent(schema, () {
        if (enumValues.every((v) => v is int)) {
          // int enum
          return code.Enum(
            (e) => e
              ..name = title
              ..values.addAll(
                enumValues.whereType<int>().map((v) {
                  return code.EnumValue(
                    (val) => val
                      ..name = '\$$v'
                      ..arguments.add(code.literalNum(v)),
                  );
                }),
              )
              ..annotations.add(
                code.refer('JsonEnum').call([], {
                  'valueField': code.literalString('value'),
                }),
              )
              ..constructors.add(
                code.Constructor(
                  (c) => c
                    ..constant = true
                    ..requiredParameters.add(
                      code.Parameter(
                        (p) => p
                          ..name = 'value'
                          ..toThis = true,
                      ),
                    ),
                ),
              )
              ..fields.add(
                code.Field(
                  (f) => f
                    ..name = 'value'
                    ..modifier = code.FieldModifier.final$
                    ..type = code.refer('int'),
                ),
              ),
          );
        } else {
          // cast to string
          return code.Enum(
            (e) => e
              ..name = title
              ..values.addAll(
                enumValues.map((v) => v.toString()).map((v) {
                  return code.EnumValue(
                    (val) => val
                      ..name = v.startsWith(RegExp(r'\d')) ? '\$$v' : v
                      ..arguments.add(code.literalString(v)),
                  );
                }),
              )
              ..annotations.add(
                code.refer('JsonEnum').call([], {
                  'valueField': code.literalString('value'),
                }),
              )
              ..constructors.add(
                code.Constructor(
                  (c) => c
                    ..constant = true
                    ..requiredParameters.add(
                      code.Parameter(
                        (p) => p
                          ..name = 'value'
                          ..toThis = true,
                      ),
                    ),
                ),
              )
              ..fields.add(
                code.Field(
                  (f) => f
                    ..name = 'value'
                    ..modifier = code.FieldModifier.final$
                    ..type = code.refer('String'),
                ),
              ),
          );
        }
      });

      return code.TypeReference(
        (t) => t
          ..symbol = schemaEnum.name
          ..isNullable = isNullable,
      );
    case SchemaType.object when schema.additionalProperties != null:
      // additional properties as map
      return code.TypeReference(
        (t) => t
          ..symbol = 'Map'
          ..types.addAll([
            code.refer('String'),
            generateSchemaType(
              schema.additionalProperties!.resolveJson(
                openApiJson,
                resolutionObject: resolvedComponentsObject,
              ),
              altName: "${title}Val",
            ),
          ])
          ..isNullable = isNullable ?? false,
      );

    case SchemaType.object:
    case null when schema.properties != null && schema.properties!.isNotEmpty:
      // check properties
      final properties = schema.properties?.map(
        (k, v) => MapEntry(
          k,
          v.resolveJson(
            openApiJson,
            resolutionObject: resolvedComponentsObject,
          ),
        ),
      );

      if (properties == null) {
        // unknown object
        return code.refer('dynamic');
      }

      final requiredProperties = EqualitySet<String>(
        const CaseInsensitiveEquality(),
      )..addAll(schema.required != null ? schema.required! : properties.keys);

      // create class
      final schemaClass = componentsStore.putIfAbsent(schema, () {
        final fields = <code.Field>[];
        final constructorParams = <code.Parameter>[];

        properties.forEach((k, v) {
          final isRequired = requiredProperties.contains(k) && !v.nullable;
          final type = generateSchemaType(v, isNullable: !isRequired);

          fields.add(
            code.Field(
              (f) => f
                ..name = k
                ..modifier = code.FieldModifier.final$
                ..type = type,
            ),
          );

          constructorParams.add(
            code.Parameter(
              (p) => p
                ..name = k
                ..named = true
                ..toThis = true
                ..required = isRequired
                ..defaultTo =
                    v.jsonSchemaDefault ??
                    (!isRequired && type.symbol!.startsWith('List')
                        ? const code.Code('const []')
                        : null),
            ),
          );
        });

        return code.Class(
          (c) => c
            ..name = title
            ..annotations.add(
              // @JsonSerializable
              code.refer('JsonSerializable').call([], {
                'includeIfNull': code.literalFalse,
                'explicitToJson': code.literalTrue,
              }),
            )
            ..constructors.add(
              code.Constructor(
                (ctor) => ctor..optionalParameters.addAll(constructorParams),
              ),
            )
            ..constructors.add(
              // package:json_serializable's "fromJson"
              code.Constructor(
                (c) => c
                  ..factory = true
                  ..name = "fromJson"
                  ..requiredParameters.add(
                    code.Parameter(
                      (p) => p
                        ..name = 'json'
                        ..type = code.TypeReference(
                          (t) => t
                            ..symbol = 'Map'
                            ..types.addAll([
                              code.refer('String'),
                              code.refer('dynamic'),
                            ]),
                        ),
                    ),
                  )
                  ..lambda = true
                  ..body = code.refer('_\$${title}FromJson').call([
                    code.literal(code.refer('json')),
                  ]).code,
              ),
            )
            ..fields.addAll(fields)
            ..methods.add(
              // package:json_serializable's "fromJson"
              code.Method(
                (m) => m
                  ..name = "toJson"
                  ..returns = code.TypeReference(
                    (t) => t
                      ..symbol = 'Map'
                      ..types.addAll([
                        code.refer('String'),
                        code.refer('dynamic'),
                      ]),
                  )
                  ..lambda = true
                  ..body = code.refer('_\$${title}ToJson').call([
                    code.literal(code.refer('this')),
                  ]).code,
              ),
            ),
        );
      });

      return code.TypeReference(
        (t) => t
          ..symbol = schemaClass.name
          ..isNullable = isNullable ?? false,
      );
    default:
      return code.refer('dynamic');
  }
}
