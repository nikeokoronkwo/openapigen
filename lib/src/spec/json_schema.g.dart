// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schema _$SchemaFromJson(Map json) => $checkedCreate(
  'Schema',
  json,
  ($checkedConvert) {
    final val = Schema(
      recursiveAnchor: $checkedConvert(
        r'$recursiveAnchor',
        (v) => v as String?,
      ),
      recursiveRef: $checkedConvert(r'$recursiveRef', (v) => v as String?),
      definitions: $checkedConvert(
        'definitions',
        (v) => (v as Map?)?.map(
          (k, e) => MapEntry(
            k as String,
            TypeOrReference<Schema>.fromJson(
              e as Map,
              (value) => Schema.fromJson(value as Map),
            ),
          ),
        ),
      ),
      dependencies: $checkedConvert(
        'dependencies',
        (v) => (v as Map?)?.map((k, e) => MapEntry(k as String, e)),
      ),
      anchor: $checkedConvert(r'$anchor', (v) => v as String?),
      comment: $checkedConvert(r'$comment', (v) => v as String?),
      defs: $checkedConvert(
        r'$defs',
        (v) => (v as Map?)?.map(
          (k, e) => MapEntry(
            k as String,
            TypeOrReference<Schema>.fromJson(
              e as Map,
              (value) => Schema.fromJson(value as Map),
            ),
          ),
        ),
      ),
      dynamicAnchor: $checkedConvert(r'$dynamicAnchor', (v) => v as String?),
      dynamicRef: $checkedConvert(r'$dynamicRef', (v) => v as String?),
      id: $checkedConvert(r'$id', (v) => v as String?),
      ref: $checkedConvert(r'$ref', (v) => v as String?),
      schema: $checkedConvert(r'$schema', (v) => v as String?),
      vocabulary: $checkedConvert(
        r'$vocabulary',
        (v) => (v as Map?)?.map((k, e) => MapEntry(k as String, e as bool)),
      ),
      additionalProperties: $checkedConvert(
        'additionalProperties',
        (v) => _additionalPropertyFromJson(v),
      ),
      allOf: $checkedConvert(
        'allOf',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TypeOrReference<Schema>.fromJson(
                e as Map,
                (value) => Schema.fromJson(value as Map),
              ),
            )
            .toList(),
      ),
      anyOf: $checkedConvert(
        'anyOf',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TypeOrReference<Schema>.fromJson(
                e as Map,
                (value) => Schema.fromJson(value as Map),
              ),
            )
            .toList(),
      ),
      contains: $checkedConvert(
        'contains',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      dependentSchemas: $checkedConvert(
        'dependentSchemas',
        (v) => (v as Map?)?.map(
          (k, e) => MapEntry(
            k as String,
            TypeOrReference<Schema>.fromJson(
              e as Map,
              (value) => Schema.fromJson(value as Map),
            ),
          ),
        ),
      ),
      jsonSchemaElse: $checkedConvert(
        'else',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      jsonSchemaIf: $checkedConvert(
        'if',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      items: $checkedConvert(
        'items',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      not: $checkedConvert(
        'not',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      oneOf: $checkedConvert(
        'oneOf',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TypeOrReference<Schema>.fromJson(
                e as Map,
                (value) => Schema.fromJson(value as Map),
              ),
            )
            .toList(),
      ),
      patternProperties: $checkedConvert(
        'patternProperties',
        (v) => (v as Map?)?.map(
          (k, e) => MapEntry(
            k as String,
            TypeOrReference<Schema>.fromJson(
              e as Map,
              (value) => Schema.fromJson(value as Map),
            ),
          ),
        ),
      ),
      prefixItems: $checkedConvert(
        'prefixItems',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TypeOrReference<Schema>.fromJson(
                e as Map,
                (value) => Schema.fromJson(value as Map),
              ),
            )
            .toList(),
      ),
      properties: $checkedConvert(
        'properties',
        (v) => (v as Map?)?.map(
          (k, e) => MapEntry(
            k as String,
            TypeOrReference<Schema>.fromJson(
              e as Map,
              (value) => Schema.fromJson(value as Map),
            ),
          ),
        ),
      ),
      propertyNames: $checkedConvert(
        'propertyNames',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      then: $checkedConvert(
        'then',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      unevaluatedItems: $checkedConvert(
        'unevaluatedItems',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      unevaluatedProperties: $checkedConvert(
        'unevaluatedProperties',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      jsonSchemaConst: $checkedConvert('const', (v) => v),
      dependentRequired: $checkedConvert(
        'dependentRequired',
        (v) => (v as Map?)?.map(
          (k, e) => MapEntry(
            k as String,
            (e as List<dynamic>).map((e) => e as String).toList(),
          ),
        ),
      ),
      jsonSchemaEnum: $checkedConvert('enum', (v) => v as List<dynamic>?),
      exclusiveMaximum: $checkedConvert(
        'exclusiveMaximum',
        (v) => (v as num?)?.toDouble(),
      ),
      exclusiveMinimum: $checkedConvert(
        'exclusiveMinimum',
        (v) => (v as num?)?.toDouble(),
      ),
      maxContains: $checkedConvert('maxContains', (v) => (v as num?)?.toInt()),
      maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
      maxItems: $checkedConvert('maxItems', (v) => (v as num?)?.toInt()),
      maxLength: $checkedConvert('maxLength', (v) => (v as num?)?.toInt()),
      maxProperties: $checkedConvert(
        'maxProperties',
        (v) => (v as num?)?.toInt(),
      ),
      minContains: $checkedConvert('minContains', (v) => (v as num?)?.toInt()),
      minimum: $checkedConvert('minimum', (v) => (v as num?)?.toDouble()),
      minItems: $checkedConvert('minItems', (v) => (v as num?)?.toInt()),
      minLength: $checkedConvert('minLength', (v) => (v as num?)?.toInt()),
      minProperties: $checkedConvert(
        'minProperties',
        (v) => (v as num?)?.toInt(),
      ),
      multipleOf: $checkedConvert('multipleOf', (v) => (v as num?)?.toDouble()),
      pattern: $checkedConvert('pattern', (v) => v as String?),
      required: $checkedConvert(
        'required',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      type: $checkedConvert(
        'type',
        (v) => $enumDecodeNullable(_$SchemaTypeEnumMap, v),
      ),
      uniqueItems: $checkedConvert('uniqueItems', (v) => v as bool?),
      jsonSchemaDefault: $checkedConvert('default', (v) => v),
      deprecated: $checkedConvert('deprecated', (v) => v as bool?),
      description: $checkedConvert('description', (v) => v as String?),
      examples: $checkedConvert('examples', (v) => v as List<dynamic>?),
      readOnly: $checkedConvert('readOnly', (v) => v as bool?),
      title: $checkedConvert('title', (v) => v as String?),
      writeOnly: $checkedConvert('writeOnly', (v) => v as bool?),
      format: $checkedConvert('format', (v) => v as String?),
      contentEncoding: $checkedConvert('contentEncoding', (v) => v as String?),
      contentMediaType: $checkedConvert(
        'contentMediaType',
        (v) => v as String?,
      ),
      contentSchema: $checkedConvert(
        'contentSchema',
        (v) => v == null
            ? null
            : TypeOrReference<Schema>.fromJson(
                v as Map,
                (value) => Schema.fromJson(value as Map),
              ),
      ),
      nullable: $checkedConvert('nullable', (v) => v as bool? ?? false),
      extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
    );
    return val;
  },
  fieldKeyMap: const {
    'recursiveAnchor': r'$recursiveAnchor',
    'recursiveRef': r'$recursiveRef',
    'anchor': r'$anchor',
    'comment': r'$comment',
    'defs': r'$defs',
    'dynamicAnchor': r'$dynamicAnchor',
    'dynamicRef': r'$dynamicRef',
    'id': r'$id',
    'ref': r'$ref',
    'schema': r'$schema',
    'vocabulary': r'$vocabulary',
    'jsonSchemaElse': 'else',
    'jsonSchemaIf': 'if',
    'jsonSchemaConst': 'const',
    'jsonSchemaEnum': 'enum',
    'jsonSchemaDefault': 'default',
  },
);

Map<String, dynamic> _$SchemaToJson(Schema instance) => <String, dynamic>{
  r'$recursiveAnchor': ?instance.recursiveAnchor,
  r'$recursiveRef': ?instance.recursiveRef,
  'definitions': ?instance.definitions?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'dependencies': ?instance.dependencies,
  r'$anchor': ?instance.anchor,
  r'$comment': ?instance.comment,
  r'$defs': ?instance.defs?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  r'$dynamicAnchor': ?instance.dynamicAnchor,
  r'$dynamicRef': ?instance.dynamicRef,
  r'$id': ?instance.id,
  r'$ref': ?instance.ref,
  r'$schema': ?instance.schema,
  r'$vocabulary': ?instance.vocabulary,
  'additionalProperties': ?instance.additionalProperties?.toJson(
    (value) => value.toJson(),
  ),
  'allOf': ?instance.allOf
      ?.map((e) => e.toJson((value) => value.toJson()))
      .toList(),
  'anyOf': ?instance.anyOf
      ?.map((e) => e.toJson((value) => value.toJson()))
      .toList(),
  'contains': ?instance.contains?.toJson((value) => value.toJson()),
  'dependentSchemas': ?instance.dependentSchemas?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'else': ?instance.jsonSchemaElse?.toJson((value) => value.toJson()),
  'if': ?instance.jsonSchemaIf?.toJson((value) => value.toJson()),
  'items': ?instance.items?.toJson((value) => value.toJson()),
  'not': ?instance.not?.toJson((value) => value.toJson()),
  'oneOf': ?instance.oneOf
      ?.map((e) => e.toJson((value) => value.toJson()))
      .toList(),
  'patternProperties': ?instance.patternProperties?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'prefixItems': ?instance.prefixItems
      ?.map((e) => e.toJson((value) => value.toJson()))
      .toList(),
  'properties': ?instance.properties?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'propertyNames': ?instance.propertyNames?.toJson((value) => value.toJson()),
  'then': ?instance.then?.toJson((value) => value.toJson()),
  'unevaluatedItems': ?instance.unevaluatedItems?.toJson(
    (value) => value.toJson(),
  ),
  'unevaluatedProperties': ?instance.unevaluatedProperties?.toJson(
    (value) => value.toJson(),
  ),
  'const': ?instance.jsonSchemaConst,
  'dependentRequired': ?instance.dependentRequired,
  'enum': ?instance.jsonSchemaEnum,
  'exclusiveMaximum': ?instance.exclusiveMaximum,
  'exclusiveMinimum': ?instance.exclusiveMinimum,
  'maxContains': ?instance.maxContains,
  'maximum': ?instance.maximum,
  'maxItems': ?instance.maxItems,
  'maxLength': ?instance.maxLength,
  'maxProperties': ?instance.maxProperties,
  'minContains': ?instance.minContains,
  'minimum': ?instance.minimum,
  'minItems': ?instance.minItems,
  'minLength': ?instance.minLength,
  'minProperties': ?instance.minProperties,
  'multipleOf': ?instance.multipleOf,
  'pattern': ?instance.pattern,
  'required': ?instance.required,
  'type': ?_$SchemaTypeEnumMap[instance.type],
  'uniqueItems': ?instance.uniqueItems,
  'default': ?instance.jsonSchemaDefault,
  'deprecated': ?instance.deprecated,
  'description': ?instance.description,
  'examples': ?instance.examples,
  'readOnly': ?instance.readOnly,
  'title': ?instance.title,
  'writeOnly': ?instance.writeOnly,
  'format': ?instance.format,
  'contentEncoding': ?instance.contentEncoding,
  'contentMediaType': ?instance.contentMediaType,
  'contentSchema': ?instance.contentSchema?.toJson((value) => value.toJson()),
  'nullable': instance.nullable,
  'extensions': ?instance.extensions,
};

const _$SchemaTypeEnumMap = {
  SchemaType.nullValue: 'null',
  SchemaType.boolean: 'boolean',
  SchemaType.object: 'object',
  SchemaType.array: 'array',
  SchemaType.number: 'number',
  SchemaType.string: 'string',
  SchemaType.integer: 'integer',
};
