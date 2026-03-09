import 'package:json_annotation/json_annotation.dart';

import 'shared.dart';

part 'json_schema.g.dart';

@JsonEnum(valueField: 'value')
enum SchemaType {
  nullValue('null'),
  boolean('boolean'),
  object('object'),
  array('array'),
  number('number'),
  string('string'),
  integer('integer');

  final String value;

  const SchemaType(this.value);
}

TypeOrReference<Schema>? _additionalPropertyFromJson(Object? object) {
  if ((object is bool && object == false) || object == null) {
    return null;
  }
  return TypeOrReference.fromJson(
    object as Map,
    (o) => Schema.fromJson(o as Map),
  );
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Schema {
  // Core vocabulary - identifiers and references
  @JsonKey(name: r"$recursiveAnchor")
  final String? recursiveAnchor;
  @JsonKey(name: r"$recursiveRef")
  final String? recursiveRef;
  @JsonKey(name: "definitions")
  final Map<String, TypeOrReference<Schema>>? definitions;
  @JsonKey(name: "dependencies")
  final Map<String, dynamic>? dependencies;
  @JsonKey(name: r"$anchor")
  final String? anchor;
  @JsonKey(name: r"$comment")
  final String? comment;
  @JsonKey(name: r"$defs")
  final Map<String, TypeOrReference<Schema>>? defs;
  @JsonKey(name: r"$dynamicAnchor")
  final String? dynamicAnchor;
  @JsonKey(name: r"$dynamicRef")
  final String? dynamicRef;
  @JsonKey(name: r"$id")
  final String? id;
  @JsonKey(name: r"$ref")
  final String? ref;
  @JsonKey(name: r"$schema")
  final String? schema;
  @JsonKey(name: r"$vocabulary")
  final Map<String, bool>? vocabulary;

  // Applicator vocabulary - schema composition
  @JsonKey(name: "additionalProperties", fromJson: _additionalPropertyFromJson)
  final TypeOrReference<Schema>? additionalProperties;
  @JsonKey(name: "allOf")
  final List<TypeOrReference<Schema>>? allOf;
  @JsonKey(name: "anyOf")
  final List<TypeOrReference<Schema>>? anyOf;
  @JsonKey(name: "contains")
  final TypeOrReference<Schema>? contains;
  @JsonKey(name: "dependentSchemas")
  final Map<String, TypeOrReference<Schema>>? dependentSchemas;
  @JsonKey(name: "else")
  final TypeOrReference<Schema>? jsonSchemaElse;
  @JsonKey(name: "if")
  final TypeOrReference<Schema>? jsonSchemaIf;
  @JsonKey(name: "items")
  final TypeOrReference<Schema>? items;
  @JsonKey(name: "not")
  final TypeOrReference<Schema>? not;
  @JsonKey(name: "oneOf")
  final List<TypeOrReference<Schema>>? oneOf;
  @JsonKey(name: "patternProperties")
  final Map<String, TypeOrReference<Schema>>? patternProperties;
  @JsonKey(name: "prefixItems")
  final List<TypeOrReference<Schema>>? prefixItems;
  @JsonKey(name: "properties")
  final Map<String, TypeOrReference<Schema>>? properties;
  @JsonKey(name: "propertyNames")
  final TypeOrReference<Schema>? propertyNames;
  @JsonKey(name: "then")
  final TypeOrReference<Schema>? then;
  @JsonKey(name: "unevaluatedItems")
  final TypeOrReference<Schema>? unevaluatedItems;
  @JsonKey(name: "unevaluatedProperties")
  final TypeOrReference<Schema>? unevaluatedProperties;

  // Validation vocabulary - constraints
  @JsonKey(name: "const")
  final dynamic jsonSchemaConst;
  @JsonKey(name: "dependentRequired")
  final Map<String, List<String>>? dependentRequired;
  @JsonKey(name: "enum")
  final List<dynamic>? jsonSchemaEnum;
  @JsonKey(name: "exclusiveMaximum")
  final double? exclusiveMaximum;
  @JsonKey(name: "exclusiveMinimum")
  final double? exclusiveMinimum;
  @JsonKey(name: "maxContains")
  final int? maxContains;
  @JsonKey(name: "maximum")
  final double? maximum;
  @JsonKey(name: "maxItems")
  final int? maxItems;
  @JsonKey(name: "maxLength")
  final int? maxLength;
  @JsonKey(name: "maxProperties")
  final int? maxProperties;
  @JsonKey(name: "minContains")
  final int? minContains;
  @JsonKey(name: "minimum")
  final double? minimum;
  @JsonKey(name: "minItems")
  final int? minItems;
  @JsonKey(name: "minLength")
  final int? minLength;
  @JsonKey(name: "minProperties")
  final int? minProperties;
  @JsonKey(name: "multipleOf")
  final double? multipleOf;
  @JsonKey(name: "pattern")
  final String? pattern;
  @JsonKey(name: "required")
  final List<String>? required;
  @JsonKey(name: "type")
  final SchemaType? type;
  @JsonKey(name: "uniqueItems")
  final bool? uniqueItems;

  // Meta-data vocabulary - annotations
  @JsonKey(name: "default")
  final dynamic jsonSchemaDefault;
  @JsonKey(name: "deprecated")
  final bool? deprecated;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "examples")
  final List<dynamic>? examples;
  @JsonKey(name: "readOnly")
  final bool? readOnly;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "writeOnly")
  final bool? writeOnly;

  // Format and content vocabulary
  @JsonKey(name: "format")
  final String? format;
  @JsonKey(name: "contentEncoding")
  final String? contentEncoding;
  @JsonKey(name: "contentMediaType")
  final String? contentMediaType;
  @JsonKey(name: "contentSchema")
  final TypeOrReference<Schema>? contentSchema;

  // other
  @JsonKey(defaultValue: false)
  final bool nullable;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  Schema({
    this.recursiveAnchor,
    this.recursiveRef,
    this.definitions,
    this.dependencies,
    this.anchor,
    this.comment,
    this.defs,
    this.dynamicAnchor,
    this.dynamicRef,
    this.id,
    this.ref,
    this.schema,
    this.vocabulary,
    this.additionalProperties,
    this.allOf,
    this.anyOf,
    this.contains,
    this.dependentSchemas,
    this.jsonSchemaElse,
    this.jsonSchemaIf,
    this.items,
    this.not,
    this.oneOf,
    this.patternProperties,
    this.prefixItems,
    this.properties,
    this.propertyNames,
    this.then,
    this.unevaluatedItems,
    this.unevaluatedProperties,
    this.jsonSchemaConst,
    this.dependentRequired,
    this.jsonSchemaEnum,
    this.exclusiveMaximum,
    this.exclusiveMinimum,
    this.maxContains,
    this.maximum,
    this.maxItems,
    this.maxLength,
    this.maxProperties,
    this.minContains,
    this.minimum,
    this.minItems,
    this.minLength,
    this.minProperties,
    this.multipleOf,
    this.pattern,
    this.required,
    this.type,
    this.uniqueItems,
    this.jsonSchemaDefault,
    this.deprecated,
    this.description,
    this.examples,
    this.readOnly,
    this.title,
    this.writeOnly,
    this.format,
    this.contentEncoding,
    this.contentMediaType,
    this.contentSchema,
    this.nullable = false,
    this.extensions,
  });

  Schema copyWith({
    String? recursiveAnchor,
    String? recursiveRef,
    Map<String, TypeOrReference<Schema>>? definitions,
    Map<String, dynamic>? dependencies,
    String? anchor,
    String? comment,
    Map<String, TypeOrReference<Schema>>? defs,
    String? dynamicAnchor,
    String? dynamicRef,
    String? id,
    String? ref,
    String? schema,
    Map<String, bool>? vocabulary,
    dynamic additionalProperties,
    List<TypeOrReference<Schema>>? allOf,
    List<TypeOrReference<Schema>>? anyOf,
    dynamic contains,
    Map<String, TypeOrReference<Schema>>? dependentSchemas,
    dynamic jsonSchemaElse,
    dynamic jsonSchemaIf,
    dynamic items,
    dynamic not,
    List<TypeOrReference<Schema>>? oneOf,
    Map<String, TypeOrReference<Schema>>? patternProperties,
    List<TypeOrReference<Schema>>? prefixItems,
    Map<String, TypeOrReference<Schema>>? properties,
    dynamic propertyNames,
    dynamic then,
    dynamic unevaluatedItems,
    dynamic unevaluatedProperties,
    dynamic jsonSchemaConst,
    Map<String, List<String>>? dependentRequired,
    List<dynamic>? jsonSchemaEnum,
    double? exclusiveMaximum,
    double? exclusiveMinimum,
    int? maxContains,
    double? maximum,
    int? maxItems,
    int? maxLength,
    int? maxProperties,
    int? minContains,
    double? minimum,
    int? minItems,
    int? minLength,
    int? minProperties,
    double? multipleOf,
    String? pattern,
    List<String>? required,
    dynamic type,
    bool? uniqueItems,
    dynamic jsonSchemaDefault,
    bool? deprecated,
    String? description,
    List<dynamic>? examples,
    bool? readOnly,
    String? title,
    bool? writeOnly,
    String? format,
    String? contentEncoding,
    String? contentMediaType,
    dynamic contentSchema,
    bool? nullable,
    Map<String, dynamic>? extensions,
  }) => Schema(
    recursiveAnchor: recursiveAnchor ?? this.recursiveAnchor,
    recursiveRef: recursiveRef ?? this.recursiveRef,
    definitions: definitions ?? this.definitions,
    dependencies: dependencies ?? this.dependencies,
    anchor: anchor ?? this.anchor,
    comment: comment ?? this.comment,
    defs: defs ?? this.defs,
    dynamicAnchor: dynamicAnchor ?? this.dynamicAnchor,
    dynamicRef: dynamicRef ?? this.dynamicRef,
    id: id ?? this.id,
    ref: ref ?? this.ref,
    schema: schema ?? this.schema,
    vocabulary: vocabulary ?? this.vocabulary,
    additionalProperties: additionalProperties ?? this.additionalProperties,
    allOf: allOf ?? this.allOf,
    anyOf: anyOf ?? this.anyOf,
    contains: contains ?? this.contains,
    dependentSchemas: dependentSchemas ?? this.dependentSchemas,
    jsonSchemaElse: jsonSchemaElse ?? this.jsonSchemaElse,
    jsonSchemaIf: jsonSchemaIf ?? this.jsonSchemaIf,
    items: items ?? this.items,
    not: not ?? this.not,
    oneOf: oneOf ?? this.oneOf,
    patternProperties: patternProperties ?? this.patternProperties,
    prefixItems: prefixItems ?? this.prefixItems,
    properties: properties ?? this.properties,
    propertyNames: propertyNames ?? this.propertyNames,
    then: then ?? this.then,
    unevaluatedItems: unevaluatedItems ?? this.unevaluatedItems,
    unevaluatedProperties: unevaluatedProperties ?? this.unevaluatedProperties,
    jsonSchemaConst: jsonSchemaConst ?? this.jsonSchemaConst,
    dependentRequired: dependentRequired ?? this.dependentRequired,
    jsonSchemaEnum: jsonSchemaEnum ?? this.jsonSchemaEnum,
    exclusiveMaximum: exclusiveMaximum ?? this.exclusiveMaximum,
    exclusiveMinimum: exclusiveMinimum ?? this.exclusiveMinimum,
    maxContains: maxContains ?? this.maxContains,
    maximum: maximum ?? this.maximum,
    maxItems: maxItems ?? this.maxItems,
    maxLength: maxLength ?? this.maxLength,
    maxProperties: maxProperties ?? this.maxProperties,
    minContains: minContains ?? this.minContains,
    minimum: minimum ?? this.minimum,
    minItems: minItems ?? this.minItems,
    minLength: minLength ?? this.minLength,
    minProperties: minProperties ?? this.minProperties,
    multipleOf: multipleOf ?? this.multipleOf,
    pattern: pattern ?? this.pattern,
    required: required ?? this.required,
    type: type ?? this.type,
    uniqueItems: uniqueItems ?? this.uniqueItems,
    jsonSchemaDefault: jsonSchemaDefault ?? this.jsonSchemaDefault,
    deprecated: deprecated ?? this.deprecated,
    description: description ?? this.description,
    examples: examples ?? this.examples,
    readOnly: readOnly ?? this.readOnly,
    title: title ?? this.title,
    writeOnly: writeOnly ?? this.writeOnly,
    format: format ?? this.format,
    contentEncoding: contentEncoding ?? this.contentEncoding,
    contentMediaType: contentMediaType ?? this.contentMediaType,
    contentSchema: contentSchema ?? this.contentSchema,
    nullable: nullable ?? this.nullable,
    extensions: extensions ?? this.extensions,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Schema &&
        other.recursiveAnchor == recursiveAnchor &&
        other.recursiveRef == recursiveRef &&
        other.definitions == definitions &&
        other.dependencies == dependencies &&
        other.anchor == anchor &&
        other.comment == comment &&
        other.defs == defs &&
        other.dynamicAnchor == dynamicAnchor &&
        other.dynamicRef == dynamicRef &&
        other.id == id &&
        other.ref == ref &&
        other.schema == schema &&
        other.vocabulary == vocabulary &&
        other.additionalProperties == additionalProperties &&
        other.allOf == allOf &&
        other.anyOf == anyOf &&
        other.contains == contains &&
        other.dependentSchemas == dependentSchemas &&
        other.jsonSchemaElse == jsonSchemaElse &&
        other.jsonSchemaIf == jsonSchemaIf &&
        other.items == items &&
        other.not == not &&
        other.oneOf == oneOf &&
        other.patternProperties == patternProperties &&
        other.prefixItems == prefixItems &&
        other.properties == properties &&
        other.propertyNames == propertyNames &&
        other.then == then &&
        other.unevaluatedItems == unevaluatedItems &&
        other.unevaluatedProperties == unevaluatedProperties &&
        other.jsonSchemaConst == jsonSchemaConst &&
        other.dependentRequired == dependentRequired &&
        other.jsonSchemaEnum == jsonSchemaEnum &&
        other.exclusiveMaximum == exclusiveMaximum &&
        other.exclusiveMinimum == exclusiveMinimum &&
        other.maxContains == maxContains &&
        other.maximum == maximum &&
        other.maxItems == maxItems &&
        other.maxLength == maxLength &&
        other.maxProperties == maxProperties &&
        other.minContains == minContains &&
        other.minimum == minimum &&
        other.minItems == minItems &&
        other.minLength == minLength &&
        other.minProperties == minProperties &&
        other.multipleOf == multipleOf &&
        other.pattern == pattern &&
        other.required == required &&
        other.type == type &&
        other.uniqueItems == uniqueItems &&
        other.jsonSchemaDefault == jsonSchemaDefault &&
        other.deprecated == deprecated &&
        other.description == description &&
        other.examples == examples &&
        other.readOnly == readOnly &&
        other.title == title &&
        other.writeOnly == writeOnly &&
        other.format == format &&
        other.contentEncoding == contentEncoding &&
        other.contentMediaType == contentMediaType &&
        other.contentSchema == contentSchema &&
        other.nullable == nullable &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      recursiveAnchor,
      recursiveRef,
      definitions,
      dependencies,
      anchor,
      comment,
      defs,
      dynamicAnchor,
      dynamicRef,
      id,
      ref,
      schema,
      vocabulary,
      additionalProperties,
      allOf,
      anyOf,
      contains,
      dependentSchemas,
      jsonSchemaElse,
      jsonSchemaIf,
      items,
      not,
      oneOf,
      patternProperties,
      prefixItems,
      properties,
      propertyNames,
      then,
      unevaluatedItems,
      unevaluatedProperties,
      jsonSchemaConst,
      dependentRequired,
      jsonSchemaEnum,
      exclusiveMaximum,
      exclusiveMinimum,
      maxContains,
      maximum,
      maxItems,
      maxLength,
      maxProperties,
      minContains,
      minimum,
      minItems,
      minLength,
      minProperties,
      multipleOf,
      pattern,
      required,
      type,
      uniqueItems,
      jsonSchemaDefault,
      deprecated,
      description,
      examples,
      readOnly,
      title,
      writeOnly,
      format,
      contentEncoding,
      contentMediaType,
      contentSchema,
      nullable,
      extensions,
    ]);
  }

  factory Schema.fromJson(Map json) => _$SchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaToJson(this);
}
