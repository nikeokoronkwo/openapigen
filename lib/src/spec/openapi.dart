import 'package:json_annotation/json_annotation.dart';

import 'json_schema.dart';
import 'shared.dart';

part 'openapi.g.dart';

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class OpenAPI {
  @JsonKey(name: "components")
  final Components? components;
  @JsonKey(name: "externalDocs")
  final ExternalDocumentation? externalDocs;
  @JsonKey(name: "info")
  final Info info;
  @JsonKey(name: "openapi")
  final String openapi;
  @JsonKey(name: "paths")
  final Map<String, PathItem> paths;
  @JsonKey(name: "security")
  final List<Map<String, List<String>>>? security;
  @JsonKey(name: "servers")
  final List<Server>? servers;
  @JsonKey(name: "tags")
  final List<Tag>? tags;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  OpenAPI({
    this.components,
    this.externalDocs,
    required this.info,
    required this.openapi,
    required this.paths,
    this.security,
    this.servers,
    this.tags,
    this.extensions,
  });

  factory OpenAPI.fromJson(Map json) => _$OpenAPIFromJson(json);

  Map<String, dynamic> toJson() => _$OpenAPIToJson(this);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Components {
  @JsonKey(name: "callbacks")
  final Map<String, TypeOrReference<Callback>>? callbacks;
  @JsonKey(name: "examples")
  final Map<String, TypeOrReference<Example>>? examples;
  @JsonKey(name: "headers")
  final Map<String, TypeOrReference<Header>>? headers;
  @JsonKey(name: "links")
  final Map<String, TypeOrReference<Link>>? links;
  @JsonKey(name: "parameters")
  final Map<String, TypeOrReference<Parameter>>? parameters;
  @JsonKey(name: "requestBodies")
  final Map<String, TypeOrReference<RequestBody>>? requestBodies;
  @JsonKey(name: "responses")
  final Map<String, TypeOrReference<Response>>? responses;
  @JsonKey(name: "schemas")
  final Map<String, TypeOrReference<Schema>>? schemas;
  @JsonKey(name: "securitySchemes")
  final Map<String, dynamic>? securitySchemes;

  Components({
    this.callbacks,
    this.examples,
    this.headers,
    this.links,
    this.parameters,
    this.requestBodies,
    this.responses,
    this.schemas,
    this.securitySchemes,
  });

  factory Components.fromJson(Map json) => _$ComponentsFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsToJson(this);
}

@JsonSerializable(anyMap: true, checked: true, disallowUnrecognizedKeys: true)
class ExternalDocumentation {
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String url;

  ExternalDocumentation({this.description, required this.url});

  factory ExternalDocumentation.fromJson(Map json) =>
      _$ExternalDocumentationFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalDocumentationToJson(this);

  ExternalDocumentation copyWith({String? url, String? description}) {
    return ExternalDocumentation(
      url: url ?? this.url,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExternalDocumentation &&
        other.url == url &&
        other.description == description;
  }

  @override
  int get hashCode {
    return Object.hash(url, description);
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Info {
  @JsonKey(name: "contact")
  final Contact? contact;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "license")
  final License? license;
  @JsonKey(name: "termsOfService")
  final String? termsOfService;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "version")
  final String version;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  Info({
    this.contact,
    this.description,
    this.license,
    this.termsOfService,
    required this.title,
    required this.version,
    this.extensions,
  });

  factory Info.fromJson(Map json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable(anyMap: true, checked: true, disallowUnrecognizedKeys: true)
class Contact {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "url")
  final String? url;

  Contact({this.email, this.name, this.url});

  factory Contact.fromJson(Map json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable(anyMap: true, checked: true, disallowUnrecognizedKeys: true)
class License {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "url")
  final String? url;

  License({required this.name, this.url});

  factory License.fromJson(Map json) => _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class PathItem {
  @JsonKey(name: r'$ref')
  final String? ref;
  final String? summary;
  final String? description;
  final Operation? get;
  final Operation? put;
  final Operation? post;
  final Operation? delete;
  final Operation? options;
  final Operation? head;
  final Operation? patch;
  final Operation? trace;
  final List<Server>? servers;
  final List<TypeOrReference<Parameter>>? parameters;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  const PathItem({
    this.ref,
    this.summary,
    this.description,
    this.get,
    this.put,
    this.post,
    this.delete,
    this.options,
    this.head,
    this.patch,
    this.trace,
    this.servers,
    this.parameters,
    this.extensions,
  });

  factory PathItem.fromJson(Map json) => _$PathItemFromJson(json);
  Map<String, dynamic> toJson() => _$PathItemToJson(this);

  PathItem copyWith({
    String? ref,
    String? summary,
    String? description,
    Operation? get,
    Operation? put,
    Operation? post,
    Operation? delete,
    Operation? options,
    Operation? head,
    Operation? patch,
    Operation? trace,
    List<Server>? servers,
    List<TypeOrReference<Parameter>>? parameters,
    Map<String, dynamic>? extensions,
  }) {
    return PathItem(
      ref: ref ?? this.ref,
      summary: summary ?? this.summary,
      description: description ?? this.description,
      get: get ?? this.get,
      put: put ?? this.put,
      post: post ?? this.post,
      delete: delete ?? this.delete,
      options: options ?? this.options,
      head: head ?? this.head,
      patch: patch ?? this.patch,
      trace: trace ?? this.trace,
      servers: servers ?? this.servers,
      parameters: parameters ?? this.parameters,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PathItem &&
        other.ref == ref &&
        other.summary == summary &&
        other.description == description &&
        other.get == get &&
        other.put == put &&
        other.post == post &&
        other.delete == delete &&
        other.options == options &&
        other.head == head &&
        other.patch == patch &&
        other.trace == trace &&
        other.servers == servers &&
        other.parameters == parameters &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hash(
      ref,
      summary,
      description,
      get,
      put,
      post,
      delete,
      options,
      head,
      patch,
      trace,
      servers,
      parameters,
      extensions,
    );
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Server {
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "variables")
  final Map<String, ServerVariable>? variables;

  Server({this.description, required this.url, this.variables});

  factory Server.fromJson(Map json) => _$ServerFromJson(json);

  Server copyWith({
    String? url,
    String? description,
    Map<String, ServerVariable>? variables,
  }) {
    return Server(
      url: url ?? this.url,
      description: description ?? this.description,
      variables: variables ?? this.variables,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Server &&
        other.url == url &&
        other.description == description &&
        other.variables == variables;
  }

  @override
  int get hashCode {
    return Object.hash(url, description, variables);
  }

  Map<String, dynamic> toJson() => _$ServerToJson(this);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,

  includeIfNull: false,
)
class ServerVariable {
  @JsonKey(name: 'default')
  final String defaultValue;
  final List<String>? enumValues;
  final String? description;

  const ServerVariable({
    required this.defaultValue,
    this.enumValues,
    this.description,
  });

  factory ServerVariable.fromJson(Map json) => _$ServerVariableFromJson(json);
  Map<String, dynamic> toJson() => _$ServerVariableToJson(this);

  ServerVariable copyWith({
    String? defaultValue,
    List<String>? enumValues,
    String? description,
  }) {
    return ServerVariable(
      defaultValue: defaultValue ?? this.defaultValue,
      enumValues: enumValues ?? this.enumValues,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServerVariable &&
        other.defaultValue == defaultValue &&
        other.enumValues == enumValues &&
        other.description == description;
  }

  @override
  int get hashCode {
    return Object.hash(defaultValue, enumValues, description);
  }
}

@JsonSerializable(anyMap: true, checked: true, disallowUnrecognizedKeys: true)
class Tag {
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "externalDocs")
  final ExternalDocumentation? externalDocs;
  @JsonKey(name: "name")
  final String name;

  Tag({this.description, this.externalDocs, required this.name});

  factory Tag.fromJson(Map json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Operation {
  final List<String>? tags;
  final String? summary;
  final String? description;
  final ExternalDocumentation? externalDocs;
  final String? operationId;
  final List<TypeOrReference<Parameter>>? parameters;
  final TypeOrReference<RequestBody>? requestBody;
  final Responses responses;
  final Map<String, TypeOrReference<Callback>>? callbacks;
  @JsonKey(defaultValue: false)
  final bool deprecated;
  final List<SecurityRequirement>? security;
  final List<Server>? servers;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  const Operation({
    this.tags,
    this.summary,
    this.description,
    this.externalDocs,
    this.operationId,
    this.parameters,
    this.requestBody,
    required this.responses,
    this.callbacks,
    this.deprecated = false,
    this.security,
    this.servers,
    this.extensions,
  });

  factory Operation.fromJson(Map json) => _$OperationFromJson(json);
  Map<String, dynamic> toJson() => _$OperationToJson(this);

  Operation copyWith({
    List<String>? tags,
    String? summary,
    String? description,
    ExternalDocumentation? externalDocs,
    String? operationId,
    List<TypeOrReference<Parameter>>? parameters,
    TypeOrReference<RequestBody>? requestBody,
    Responses? responses,
    Map<String, TypeOrReference<Callback>>? callbacks,
    bool? deprecated,
    List<SecurityRequirement>? security,
    List<Server>? servers,
    Map<String, dynamic>? extensions,
  }) {
    return Operation(
      tags: tags ?? this.tags,
      summary: summary ?? this.summary,
      description: description ?? this.description,
      externalDocs: externalDocs ?? this.externalDocs,
      operationId: operationId ?? this.operationId,
      parameters: parameters ?? this.parameters,
      requestBody: requestBody ?? this.requestBody,
      responses: responses ?? this.responses,
      callbacks: callbacks ?? this.callbacks,
      deprecated: deprecated ?? this.deprecated,
      security: security ?? this.security,
      servers: servers ?? this.servers,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Operation &&
        other.tags == tags &&
        other.summary == summary &&
        other.description == description &&
        other.externalDocs == externalDocs &&
        other.operationId == operationId &&
        other.parameters == parameters &&
        other.requestBody == requestBody &&
        other.responses == responses &&
        other.callbacks == callbacks &&
        other.deprecated == deprecated &&
        other.security == security &&
        other.servers == servers &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hash(
      tags,
      summary,
      description,
      externalDocs,
      operationId,
      parameters,
      requestBody,
      responses,
      callbacks,
      deprecated,
      security,
      servers,
      extensions,
    );
  }
}

typedef SecurityRequirement = Map<String, List<String>>;

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Parameter {
  final String name;
  @JsonKey(name: 'in')
  final String location;
  final String? description;
  @JsonKey(defaultValue: false)
  final bool required;
  @JsonKey(defaultValue: false)
  final bool deprecated;
  @JsonKey(defaultValue: false)
  final bool allowEmptyValue;
  final String? style;
  final bool? explode;
  @JsonKey(defaultValue: false)
  final bool allowReserved;
  final TypeOrReference<Schema>? schema;
  final Map<String, MediaType>? content;
  final dynamic example;
  final Map<String, TypeOrReference<Example>>? examples;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  const Parameter({
    required this.name,
    required this.location,
    this.description,
    this.required = false,
    this.deprecated = false,
    this.allowEmptyValue = false,
    this.style,
    this.explode,
    this.allowReserved = false,
    this.schema,
    this.content,
    this.example,
    this.examples,
    this.extensions,
  }) : assert(
         schema == null || content == null,
         'Schema and content are mutually exclusive',
       );

  factory Parameter.fromJson(Map json) => _$ParameterFromJson(json);
  Map<String, dynamic> toJson() => _$ParameterToJson(this);

  Parameter copyWith({
    String? name,
    String? location,
    String? description,
    bool? required,
    bool? deprecated,
    bool? allowEmptyValue,
    String? style,
    bool? explode,
    bool? allowReserved,
    TypeOrReference<Schema>? schema,
    Map<String, MediaType>? content,
    dynamic example,
    Map<String, TypeOrReference<Example>>? examples,
    Map<String, dynamic>? extensions,
  }) {
    return Parameter(
      name: name ?? this.name,
      location: location ?? this.location,
      description: description ?? this.description,
      required: required ?? this.required,
      deprecated: deprecated ?? this.deprecated,
      allowEmptyValue: allowEmptyValue ?? this.allowEmptyValue,
      style: style ?? this.style,
      explode: explode ?? this.explode,
      allowReserved: allowReserved ?? this.allowReserved,
      schema: schema ?? this.schema,
      content: content ?? this.content,
      example: example ?? this.example,
      examples: examples ?? this.examples,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Parameter &&
        other.name == name &&
        other.location == location &&
        other.description == description &&
        other.required == required &&
        other.deprecated == deprecated &&
        other.allowEmptyValue == allowEmptyValue &&
        other.style == style &&
        other.explode == explode &&
        other.allowReserved == allowReserved &&
        other.schema == schema &&
        other.content == content &&
        other.example == example &&
        other.examples == examples &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      location,
      description,
      required,
      deprecated,
      allowEmptyValue,
      style,
      explode,
      allowReserved,
      schema,
      content,
      example,
      examples,
      extensions,
    );
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class RequestBody {
  final Map<String, MediaType> content;
  final String? description;
  @JsonKey(defaultValue: false)
  final bool required;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  const RequestBody({
    required this.content,
    this.description,
    this.required = false,
    this.extensions,
  });

  factory RequestBody.fromJson(Map json) => _$RequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RequestBodyToJson(this);

  RequestBody copyWith({
    Map<String, MediaType>? content,
    String? description,
    bool? required,
    Map<String, dynamic>? extensions,
  }) {
    return RequestBody(
      content: content ?? this.content,
      description: description ?? this.description,
      required: required ?? this.required,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RequestBody &&
        other.content == content &&
        other.description == description &&
        other.required == required &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hash(content, description, required, extensions);
  }
}

class Responses {
  final TypeOrReference<Response>? defaultResponse;
  final Map<String, TypeOrReference<Response>>? statusCodeResponses;

  const Responses({this.defaultResponse, this.statusCodeResponses});

  factory Responses.fromJson(Map json) {
    return Responses(
      defaultResponse: json['default'] != null
          ? TypeOrReference<Response>.fromJson(
              json['default'] as Map,
              (o) => Response.fromJson(o as Map),
            )
          : null,
      statusCodeResponses: () {
        final responses = <String, TypeOrReference<Response>>{};
        for (final entry in json.entries) {
          if (entry.key != 'default' &&
              RegExp(r'^[1-5](?:\d{2}|XX)$').hasMatch(entry.key)) {
            responses[entry.key] = TypeOrReference<Response>.fromJson(
              entry.value as Map,
              (o) => Response.fromJson(o as Map),
            );
          }
        }
        return responses.isNotEmpty ? responses : null;
      }(),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (defaultResponse != null) {
      json['default'] = defaultResponse!.toJson((v) => v.toJson());
    }
    if (statusCodeResponses != null) {
      json.addAll(
        statusCodeResponses!.map(
          (key, value) => MapEntry(key, value.toJson((v) => v.toJson())),
        ),
      );
    }

    return json;
  }

  Responses copyWith({
    TypeOrReference<Response>? defaultResponse,
    Map<String, TypeOrReference<Response>>? statusCodeResponses,
  }) {
    return Responses(
      defaultResponse: defaultResponse ?? this.defaultResponse,
      statusCodeResponses: statusCodeResponses ?? this.statusCodeResponses,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Responses &&
        other.defaultResponse == defaultResponse &&
        other.statusCodeResponses == statusCodeResponses;
  }

  @override
  int get hashCode {
    return Object.hash(defaultResponse, statusCodeResponses);
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Response {
  final String description;
  final Map<String, TypeOrReference<Header>>? headers;
  final Map<String, MediaType>? content;
  final Map<String, TypeOrReference<Link>>? links;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  const Response({
    required this.description,
    this.headers,
    this.content,
    this.links,
    this.extensions,
  });

  factory Response.fromJson(Map json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  Response copyWith({
    String? description,
    Map<String, TypeOrReference<Header>>? headers,
    Map<String, MediaType>? content,
    Map<String, TypeOrReference<Link>>? links,
    Map<String, dynamic>? extensions,
  }) {
    return Response(
      description: description ?? this.description,
      headers: headers ?? this.headers,
      content: content ?? this.content,
      links: links ?? this.links,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Response &&
        other.description == description &&
        other.headers == headers &&
        other.content == content &&
        other.links == links &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hash(description, headers, content, links, extensions);
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Callback {
  final Map<String, PathItem> pathItems;

  const Callback({required this.pathItems});

  factory Callback.fromJson(Map json) => _$CallbackFromJson(json);
  Map<String, dynamic> toJson() => _$CallbackToJson(this);

  Callback copyWith({Map<String, PathItem>? pathItems}) {
    return Callback(pathItems: pathItems ?? this.pathItems);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Callback && other.pathItems == pathItems;
  }

  @override
  int get hashCode {
    return pathItems.hashCode;
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class MediaType {
  final TypeOrReference<Schema>? schema;
  final dynamic example;
  final Map<String, TypeOrReference<Example>>? examples;
  final Map<String, Encoding>? encoding;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  const MediaType({
    this.schema,
    this.example,
    this.examples,
    this.encoding,
    this.extensions,
  });

  factory MediaType.fromJson(Map json) => _$MediaTypeFromJson(json);
  Map<String, dynamic> toJson() => _$MediaTypeToJson(this);

  MediaType copyWith({
    TypeOrReference<Schema>? schema,
    dynamic example,
    Map<String, TypeOrReference<Example>>? examples,
    Map<String, Encoding>? encoding,
    Map<String, dynamic>? extensions,
  }) {
    return MediaType(
      schema: schema ?? this.schema,
      example: example ?? this.example,
      examples: examples ?? this.examples,
      encoding: encoding ?? this.encoding,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MediaType &&
        other.schema == schema &&
        other.example == example &&
        other.examples == examples &&
        other.encoding == encoding &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hash(schema, example, examples, encoding, extensions);
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Example {
  final String? summary;
  final String? description;
  final dynamic value;
  @JsonKey(name: 'external_value')
  final String? externalValue;

  const Example({
    this.summary,
    this.description,
    this.value,
    this.externalValue,
  });

  factory Example.fromJson(Map json) => _$ExampleFromJson(json);
  Map<String, dynamic> toJson() => _$ExampleToJson(this);

  Example copyWith({
    String? summary,
    String? description,
    dynamic value,
    String? externalValue,
  }) {
    return Example(
      summary: summary ?? this.summary,
      description: description ?? this.description,
      value: value ?? this.value,
      externalValue: externalValue ?? this.externalValue,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Example &&
        other.summary == summary &&
        other.description == description &&
        other.value == value &&
        other.externalValue == externalValue;
  }

  @override
  int get hashCode {
    return Object.hash(summary, description, value, externalValue);
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Header {
  final String? description;
  @JsonKey(defaultValue: false)
  final bool required;
  @JsonKey(defaultValue: false)
  final bool deprecated;
  @JsonKey(defaultValue: false)
  final bool allowEmptyValue;
  final String style;
  final bool? explode;
  @JsonKey(defaultValue: false)
  final bool allowReserved;
  final TypeOrReference<Schema>? schema;
  final Map<String, MediaType>? content;
  final dynamic example;
  final Map<String, TypeOrReference<Example>>? examples;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  const Header({
    this.description,
    this.required = false,
    this.deprecated = false,
    this.allowEmptyValue = false,
    this.style = 'simple',
    this.explode,
    this.allowReserved = false,
    this.schema,
    this.content,
    this.example,
    this.examples,
    this.extensions,
  }) : assert(
         schema == null || content == null,
         'Schema and content are mutually exclusive',
       );

  factory Header.fromJson(Map json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  Header copyWith({
    String? description,
    bool? required,
    bool? deprecated,
    bool? allowEmptyValue,
    String? style,
    bool? explode,
    bool? allowReserved,
    TypeOrReference<Schema>? schema,
    Map<String, MediaType>? content,
    dynamic example,
    Map<String, TypeOrReference<Example>>? examples,
    Map<String, dynamic>? extensions,
  }) {
    return Header(
      description: description ?? this.description,
      required: required ?? this.required,
      deprecated: deprecated ?? this.deprecated,
      allowEmptyValue: allowEmptyValue ?? this.allowEmptyValue,
      style: style ?? this.style,
      explode: explode ?? this.explode,
      allowReserved: allowReserved ?? this.allowReserved,
      schema: schema ?? this.schema,
      content: content ?? this.content,
      example: example ?? this.example,
      examples: examples ?? this.examples,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Header &&
        other.description == description &&
        other.required == required &&
        other.deprecated == deprecated &&
        other.allowEmptyValue == allowEmptyValue &&
        other.style == style &&
        other.explode == explode &&
        other.allowReserved == allowReserved &&
        other.schema == schema &&
        other.content == content &&
        other.example == example &&
        other.examples == examples &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hash(
      description,
      required,
      deprecated,
      allowEmptyValue,
      style,
      explode,
      allowReserved,
      schema,
      content,
      example,
      examples,
      extensions,
    );
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Link {
  final String? operationId;
  @JsonKey(name: 'operation_ref')
  final String? operationRef;
  final Map<String, dynamic>? parameters;
  final dynamic requestBody;
  final String? description;
  final Server? server;

  const Link({
    this.operationId,
    this.operationRef,
    this.parameters,
    this.requestBody,
    this.description,
    this.server,
  }) : assert(
         operationId == null || operationRef == null,
         'OperationId and operationRef are mutually exclusive',
       );

  factory Link.fromJson(Map json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);

  Link copyWith({
    String? operationId,
    String? operationRef,
    Map<String, dynamic>? parameters,
    dynamic requestBody,
    String? description,
    Server? server,
  }) {
    return Link(
      operationId: operationId ?? this.operationId,
      operationRef: operationRef ?? this.operationRef,
      parameters: parameters ?? this.parameters,
      requestBody: requestBody ?? this.requestBody,
      description: description ?? this.description,
      server: server ?? this.server,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Link &&
        other.operationId == operationId &&
        other.operationRef == operationRef &&
        other.parameters == parameters &&
        other.requestBody == requestBody &&
        other.description == description &&
        other.server == server;
  }

  @override
  int get hashCode {
    return Object.hash(
      operationId,
      operationRef,
      parameters,
      requestBody,
      description,
      server,
    );
  }
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Encoding {
  final String? contentType;
  final Map<String, TypeOrReference<Header>>? headers;
  final String? style;
  final bool? explode;
  @JsonKey(defaultValue: false)
  final bool allowReserved;
  @JsonKey(fromJson: extractExtensions)
  final Map<String, dynamic>? extensions;

  const Encoding({
    this.contentType,
    this.headers,
    this.style,
    this.explode,
    this.allowReserved = false,
    this.extensions,
  });

  factory Encoding.fromJson(Map json) => _$EncodingFromJson(json);
  Map<String, dynamic> toJson() => _$EncodingToJson(this);

  Encoding copyWith({
    String? contentType,
    Map<String, TypeOrReference<Header>>? headers,
    String? style,
    bool? explode,
    bool? allowReserved,
    Map<String, dynamic>? extensions,
  }) {
    return Encoding(
      contentType: contentType ?? this.contentType,
      headers: headers ?? this.headers,
      style: style ?? this.style,
      explode: explode ?? this.explode,
      allowReserved: allowReserved ?? this.allowReserved,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Encoding &&
        other.contentType == contentType &&
        other.headers == headers &&
        other.style == style &&
        other.explode == explode &&
        other.allowReserved == allowReserved &&
        other.extensions == extensions;
  }

  @override
  int get hashCode {
    return Object.hash(
      contentType,
      headers,
      style,
      explode,
      allowReserved,
      extensions,
    );
  }
}
