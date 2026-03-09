// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenAPI _$OpenAPIFromJson(Map json) => $checkedCreate('OpenAPI', json, (
  $checkedConvert,
) {
  final val = OpenAPI(
    components: $checkedConvert(
      'components',
      (v) => v == null ? null : Components.fromJson(v as Map),
    ),
    externalDocs: $checkedConvert(
      'externalDocs',
      (v) => v == null ? null : ExternalDocumentation.fromJson(v as Map),
    ),
    info: $checkedConvert('info', (v) => Info.fromJson(v as Map)),
    openapi: $checkedConvert('openapi', (v) => v as String),
    paths: $checkedConvert(
      'paths',
      (v) => (v as Map).map(
        (k, e) => MapEntry(k as String, PathItem.fromJson(e as Map)),
      ),
    ),
    security: $checkedConvert(
      'security',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => (e as Map).map(
              (k, e) => MapEntry(
                k as String,
                (e as List<dynamic>).map((e) => e as String).toList(),
              ),
            ),
          )
          .toList(),
    ),
    servers: $checkedConvert(
      'servers',
      (v) =>
          (v as List<dynamic>?)?.map((e) => Server.fromJson(e as Map)).toList(),
    ),
    tags: $checkedConvert(
      'tags',
      (v) => (v as List<dynamic>?)?.map((e) => Tag.fromJson(e as Map)).toList(),
    ),
    extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
  );
  return val;
});

Map<String, dynamic> _$OpenAPIToJson(OpenAPI instance) => <String, dynamic>{
  'components': ?instance.components?.toJson(),
  'externalDocs': ?instance.externalDocs?.toJson(),
  'info': instance.info.toJson(),
  'openapi': instance.openapi,
  'paths': instance.paths.map((k, e) => MapEntry(k, e.toJson())),
  'security': ?instance.security,
  'servers': ?instance.servers?.map((e) => e.toJson()).toList(),
  'tags': ?instance.tags?.map((e) => e.toJson()).toList(),
  'extensions': ?instance.extensions,
};

Components _$ComponentsFromJson(Map json) =>
    $checkedCreate('Components', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'callbacks',
          'examples',
          'headers',
          'links',
          'parameters',
          'requestBodies',
          'responses',
          'schemas',
          'securitySchemes',
        ],
      );
      final val = Components(
        callbacks: $checkedConvert(
          'callbacks',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Callback>.fromJson(
                e as Map,
                (value) => Callback.fromJson(value as Map),
              ),
            ),
          ),
        ),
        examples: $checkedConvert(
          'examples',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Example>.fromJson(
                e as Map,
                (value) => Example.fromJson(value as Map),
              ),
            ),
          ),
        ),
        headers: $checkedConvert(
          'headers',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Header>.fromJson(
                e as Map,
                (value) => Header.fromJson(value as Map),
              ),
            ),
          ),
        ),
        links: $checkedConvert(
          'links',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Link>.fromJson(
                e as Map,
                (value) => Link.fromJson(value as Map),
              ),
            ),
          ),
        ),
        parameters: $checkedConvert(
          'parameters',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Parameter>.fromJson(
                e as Map,
                (value) => Parameter.fromJson(value as Map),
              ),
            ),
          ),
        ),
        requestBodies: $checkedConvert(
          'requestBodies',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<RequestBody>.fromJson(
                e as Map,
                (value) => RequestBody.fromJson(value as Map),
              ),
            ),
          ),
        ),
        responses: $checkedConvert(
          'responses',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Response>.fromJson(
                e as Map,
                (value) => Response.fromJson(value as Map),
              ),
            ),
          ),
        ),
        schemas: $checkedConvert(
          'schemas',
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
        securitySchemes: $checkedConvert(
          'securitySchemes',
          (v) => (v as Map?)?.map((k, e) => MapEntry(k as String, e)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ComponentsToJson(Components instance) =>
    <String, dynamic>{
      'callbacks': ?instance.callbacks?.map(
        (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
      ),
      'examples': ?instance.examples?.map(
        (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
      ),
      'headers': ?instance.headers?.map(
        (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
      ),
      'links': ?instance.links?.map(
        (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
      ),
      'parameters': ?instance.parameters?.map(
        (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
      ),
      'requestBodies': ?instance.requestBodies?.map(
        (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
      ),
      'responses': ?instance.responses?.map(
        (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
      ),
      'schemas': ?instance.schemas?.map(
        (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
      ),
      'securitySchemes': ?instance.securitySchemes,
    };

ExternalDocumentation _$ExternalDocumentationFromJson(Map json) =>
    $checkedCreate('ExternalDocumentation', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['description', 'url']);
      final val = ExternalDocumentation(
        description: $checkedConvert('description', (v) => v as String?),
        url: $checkedConvert('url', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ExternalDocumentationToJson(
  ExternalDocumentation instance,
) => <String, dynamic>{
  'description': instance.description,
  'url': instance.url,
};

Info _$InfoFromJson(Map json) =>
    $checkedCreate('Info', json, ($checkedConvert) {
      final val = Info(
        contact: $checkedConvert(
          'contact',
          (v) => v == null ? null : Contact.fromJson(v as Map),
        ),
        description: $checkedConvert('description', (v) => v as String?),
        license: $checkedConvert(
          'license',
          (v) => v == null ? null : License.fromJson(v as Map),
        ),
        termsOfService: $checkedConvert('termsOfService', (v) => v as String?),
        title: $checkedConvert('title', (v) => v as String),
        version: $checkedConvert('version', (v) => v as String),
        extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
      );
      return val;
    });

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
  'contact': ?instance.contact?.toJson(),
  'description': ?instance.description,
  'license': ?instance.license?.toJson(),
  'termsOfService': ?instance.termsOfService,
  'title': instance.title,
  'version': instance.version,
  'extensions': ?instance.extensions,
};

Contact _$ContactFromJson(Map json) =>
    $checkedCreate('Contact', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['email', 'name', 'url']);
      final val = Contact(
        email: $checkedConvert('email', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        url: $checkedConvert('url', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
  'email': instance.email,
  'name': instance.name,
  'url': instance.url,
};

License _$LicenseFromJson(Map json) =>
    $checkedCreate('License', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['name', 'url']);
      final val = License(
        name: $checkedConvert('name', (v) => v as String),
        url: $checkedConvert('url', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LicenseToJson(License instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

PathItem _$PathItemFromJson(Map json) => $checkedCreate('PathItem', json, (
  $checkedConvert,
) {
  final val = PathItem(
    ref: $checkedConvert(r'$ref', (v) => v as String?),
    summary: $checkedConvert('summary', (v) => v as String?),
    description: $checkedConvert('description', (v) => v as String?),
    get: $checkedConvert(
      'get',
      (v) => v == null ? null : Operation.fromJson(v as Map),
    ),
    put: $checkedConvert(
      'put',
      (v) => v == null ? null : Operation.fromJson(v as Map),
    ),
    post: $checkedConvert(
      'post',
      (v) => v == null ? null : Operation.fromJson(v as Map),
    ),
    delete: $checkedConvert(
      'delete',
      (v) => v == null ? null : Operation.fromJson(v as Map),
    ),
    options: $checkedConvert(
      'options',
      (v) => v == null ? null : Operation.fromJson(v as Map),
    ),
    head: $checkedConvert(
      'head',
      (v) => v == null ? null : Operation.fromJson(v as Map),
    ),
    patch: $checkedConvert(
      'patch',
      (v) => v == null ? null : Operation.fromJson(v as Map),
    ),
    trace: $checkedConvert(
      'trace',
      (v) => v == null ? null : Operation.fromJson(v as Map),
    ),
    servers: $checkedConvert(
      'servers',
      (v) =>
          (v as List<dynamic>?)?.map((e) => Server.fromJson(e as Map)).toList(),
    ),
    parameters: $checkedConvert(
      'parameters',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => TypeOrReference<Parameter>.fromJson(
              e as Map,
              (value) => Parameter.fromJson(value as Map),
            ),
          )
          .toList(),
    ),
    extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
  );
  return val;
}, fieldKeyMap: const {'ref': r'$ref'});

Map<String, dynamic> _$PathItemToJson(PathItem instance) => <String, dynamic>{
  r'$ref': ?instance.ref,
  'summary': ?instance.summary,
  'description': ?instance.description,
  'get': ?instance.get?.toJson(),
  'put': ?instance.put?.toJson(),
  'post': ?instance.post?.toJson(),
  'delete': ?instance.delete?.toJson(),
  'options': ?instance.options?.toJson(),
  'head': ?instance.head?.toJson(),
  'patch': ?instance.patch?.toJson(),
  'trace': ?instance.trace?.toJson(),
  'servers': ?instance.servers?.map((e) => e.toJson()).toList(),
  'parameters': ?instance.parameters
      ?.map((e) => e.toJson((value) => value.toJson()))
      .toList(),
  'extensions': ?instance.extensions,
};

Server _$ServerFromJson(Map json) =>
    $checkedCreate('Server', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['description', 'url', 'variables']);
      final val = Server(
        description: $checkedConvert('description', (v) => v as String?),
        url: $checkedConvert('url', (v) => v as String),
        variables: $checkedConvert(
          'variables',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(k as String, ServerVariable.fromJson(e as Map)),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ServerToJson(Server instance) => <String, dynamic>{
  'description': ?instance.description,
  'url': instance.url,
  'variables': ?instance.variables?.map((k, e) => MapEntry(k, e.toJson())),
};

ServerVariable _$ServerVariableFromJson(Map json) =>
    $checkedCreate('ServerVariable', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['default', 'enumValues', 'description'],
      );
      final val = ServerVariable(
        defaultValue: $checkedConvert('default', (v) => v as String),
        enumValues: $checkedConvert(
          'enumValues',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'defaultValue': 'default'});

Map<String, dynamic> _$ServerVariableToJson(ServerVariable instance) =>
    <String, dynamic>{
      'default': instance.defaultValue,
      'enumValues': ?instance.enumValues,
      'description': ?instance.description,
    };

Tag _$TagFromJson(Map json) => $checkedCreate('Tag', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['description', 'externalDocs', 'name']);
  final val = Tag(
    description: $checkedConvert('description', (v) => v as String?),
    externalDocs: $checkedConvert(
      'externalDocs',
      (v) => v == null ? null : ExternalDocumentation.fromJson(v as Map),
    ),
    name: $checkedConvert('name', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
  'description': instance.description,
  'externalDocs': instance.externalDocs?.toJson(),
  'name': instance.name,
};

Operation _$OperationFromJson(Map json) => $checkedCreate('Operation', json, (
  $checkedConvert,
) {
  final val = Operation(
    tags: $checkedConvert(
      'tags',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    summary: $checkedConvert('summary', (v) => v as String?),
    description: $checkedConvert('description', (v) => v as String?),
    externalDocs: $checkedConvert(
      'externalDocs',
      (v) => v == null ? null : ExternalDocumentation.fromJson(v as Map),
    ),
    operationId: $checkedConvert('operationId', (v) => v as String?),
    parameters: $checkedConvert(
      'parameters',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => TypeOrReference<Parameter>.fromJson(
              e as Map,
              (value) => Parameter.fromJson(value as Map),
            ),
          )
          .toList(),
    ),
    requestBody: $checkedConvert(
      'requestBody',
      (v) => v == null
          ? null
          : TypeOrReference<RequestBody>.fromJson(
              v as Map,
              (value) => RequestBody.fromJson(value as Map),
            ),
    ),
    responses: $checkedConvert(
      'responses',
      (v) => Responses.fromJson(v as Map),
    ),
    callbacks: $checkedConvert(
      'callbacks',
      (v) => (v as Map?)?.map(
        (k, e) => MapEntry(
          k as String,
          TypeOrReference<Callback>.fromJson(
            e as Map,
            (value) => Callback.fromJson(value as Map),
          ),
        ),
      ),
    ),
    deprecated: $checkedConvert('deprecated', (v) => v as bool? ?? false),
    security: $checkedConvert(
      'security',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => (e as Map).map(
              (k, e) => MapEntry(
                k as String,
                (e as List<dynamic>).map((e) => e as String).toList(),
              ),
            ),
          )
          .toList(),
    ),
    servers: $checkedConvert(
      'servers',
      (v) =>
          (v as List<dynamic>?)?.map((e) => Server.fromJson(e as Map)).toList(),
    ),
    extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
  );
  return val;
});

Map<String, dynamic> _$OperationToJson(Operation instance) => <String, dynamic>{
  'tags': ?instance.tags,
  'summary': ?instance.summary,
  'description': ?instance.description,
  'externalDocs': ?instance.externalDocs?.toJson(),
  'operationId': ?instance.operationId,
  'parameters': ?instance.parameters
      ?.map((e) => e.toJson((value) => value.toJson()))
      .toList(),
  'requestBody': ?instance.requestBody?.toJson((value) => value.toJson()),
  'responses': instance.responses.toJson(),
  'callbacks': ?instance.callbacks?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'deprecated': instance.deprecated,
  'security': ?instance.security,
  'servers': ?instance.servers?.map((e) => e.toJson()).toList(),
  'extensions': ?instance.extensions,
};

Parameter _$ParameterFromJson(Map json) => $checkedCreate('Parameter', json, (
  $checkedConvert,
) {
  final val = Parameter(
    name: $checkedConvert('name', (v) => v as String),
    location: $checkedConvert('in', (v) => v as String),
    description: $checkedConvert('description', (v) => v as String?),
    required: $checkedConvert('required', (v) => v as bool? ?? false),
    deprecated: $checkedConvert('deprecated', (v) => v as bool? ?? false),
    allowEmptyValue: $checkedConvert(
      'allowEmptyValue',
      (v) => v as bool? ?? false,
    ),
    style: $checkedConvert('style', (v) => v as String?),
    explode: $checkedConvert('explode', (v) => v as bool?),
    allowReserved: $checkedConvert('allowReserved', (v) => v as bool? ?? false),
    schema: $checkedConvert(
      'schema',
      (v) => v == null
          ? null
          : TypeOrReference<Schema>.fromJson(
              v as Map,
              (value) => Schema.fromJson(value as Map),
            ),
    ),
    content: $checkedConvert(
      'content',
      (v) => (v as Map?)?.map(
        (k, e) => MapEntry(k as String, MediaType.fromJson(e as Map)),
      ),
    ),
    example: $checkedConvert('example', (v) => v),
    examples: $checkedConvert(
      'examples',
      (v) => (v as Map?)?.map(
        (k, e) => MapEntry(
          k as String,
          TypeOrReference<Example>.fromJson(
            e as Map,
            (value) => Example.fromJson(value as Map),
          ),
        ),
      ),
    ),
    extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
  );
  return val;
}, fieldKeyMap: const {'location': 'in'});

Map<String, dynamic> _$ParameterToJson(Parameter instance) => <String, dynamic>{
  'name': instance.name,
  'in': instance.location,
  'description': ?instance.description,
  'required': instance.required,
  'deprecated': instance.deprecated,
  'allowEmptyValue': instance.allowEmptyValue,
  'style': ?instance.style,
  'explode': ?instance.explode,
  'allowReserved': instance.allowReserved,
  'schema': ?instance.schema?.toJson((value) => value.toJson()),
  'content': ?instance.content?.map((k, e) => MapEntry(k, e.toJson())),
  'example': ?instance.example,
  'examples': ?instance.examples?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'extensions': ?instance.extensions,
};

RequestBody _$RequestBodyFromJson(Map json) =>
    $checkedCreate('RequestBody', json, ($checkedConvert) {
      final val = RequestBody(
        content: $checkedConvert(
          'content',
          (v) => (v as Map).map(
            (k, e) => MapEntry(k as String, MediaType.fromJson(e as Map)),
          ),
        ),
        description: $checkedConvert('description', (v) => v as String?),
        required: $checkedConvert('required', (v) => v as bool? ?? false),
        extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
      );
      return val;
    });

Map<String, dynamic> _$RequestBodyToJson(RequestBody instance) =>
    <String, dynamic>{
      'content': instance.content.map((k, e) => MapEntry(k, e.toJson())),
      'description': ?instance.description,
      'required': instance.required,
      'extensions': ?instance.extensions,
    };

Response _$ResponseFromJson(Map json) =>
    $checkedCreate('Response', json, ($checkedConvert) {
      final val = Response(
        description: $checkedConvert('description', (v) => v as String),
        headers: $checkedConvert(
          'headers',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Header>.fromJson(
                e as Map,
                (value) => Header.fromJson(value as Map),
              ),
            ),
          ),
        ),
        content: $checkedConvert(
          'content',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(k as String, MediaType.fromJson(e as Map)),
          ),
        ),
        links: $checkedConvert(
          'links',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Link>.fromJson(
                e as Map,
                (value) => Link.fromJson(value as Map),
              ),
            ),
          ),
        ),
        extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
      );
      return val;
    });

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
  'description': instance.description,
  'headers': ?instance.headers?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'content': ?instance.content?.map((k, e) => MapEntry(k, e.toJson())),
  'links': ?instance.links?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'extensions': ?instance.extensions,
};

Callback _$CallbackFromJson(Map json) =>
    $checkedCreate('Callback', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['pathItems']);
      final val = Callback(
        pathItems: $checkedConvert(
          'pathItems',
          (v) => (v as Map).map(
            (k, e) => MapEntry(k as String, PathItem.fromJson(e as Map)),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CallbackToJson(Callback instance) => <String, dynamic>{
  'pathItems': instance.pathItems.map((k, e) => MapEntry(k, e.toJson())),
};

MediaType _$MediaTypeFromJson(Map json) =>
    $checkedCreate('MediaType', json, ($checkedConvert) {
      final val = MediaType(
        schema: $checkedConvert(
          'schema',
          (v) => v == null
              ? null
              : TypeOrReference<Schema>.fromJson(
                  v as Map,
                  (value) => Schema.fromJson(value as Map),
                ),
        ),
        example: $checkedConvert('example', (v) => v),
        examples: $checkedConvert(
          'examples',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(
              k as String,
              TypeOrReference<Example>.fromJson(
                e as Map,
                (value) => Example.fromJson(value as Map),
              ),
            ),
          ),
        ),
        encoding: $checkedConvert(
          'encoding',
          (v) => (v as Map?)?.map(
            (k, e) => MapEntry(k as String, Encoding.fromJson(e as Map)),
          ),
        ),
        extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
      );
      return val;
    });

Map<String, dynamic> _$MediaTypeToJson(MediaType instance) => <String, dynamic>{
  'schema': ?instance.schema?.toJson((value) => value.toJson()),
  'example': ?instance.example,
  'examples': ?instance.examples?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'encoding': ?instance.encoding?.map((k, e) => MapEntry(k, e.toJson())),
  'extensions': ?instance.extensions,
};

Example _$ExampleFromJson(Map json) => $checkedCreate('Example', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    allowedKeys: const ['summary', 'description', 'value', 'external_value'],
  );
  final val = Example(
    summary: $checkedConvert('summary', (v) => v as String?),
    description: $checkedConvert('description', (v) => v as String?),
    value: $checkedConvert('value', (v) => v),
    externalValue: $checkedConvert('external_value', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'externalValue': 'external_value'});

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
  'summary': ?instance.summary,
  'description': ?instance.description,
  'value': ?instance.value,
  'external_value': ?instance.externalValue,
};

Header _$HeaderFromJson(Map json) => $checkedCreate('Header', json, (
  $checkedConvert,
) {
  final val = Header(
    description: $checkedConvert('description', (v) => v as String?),
    required: $checkedConvert('required', (v) => v as bool? ?? false),
    deprecated: $checkedConvert('deprecated', (v) => v as bool? ?? false),
    allowEmptyValue: $checkedConvert(
      'allowEmptyValue',
      (v) => v as bool? ?? false,
    ),
    style: $checkedConvert('style', (v) => v as String? ?? 'simple'),
    explode: $checkedConvert('explode', (v) => v as bool?),
    allowReserved: $checkedConvert('allowReserved', (v) => v as bool? ?? false),
    schema: $checkedConvert(
      'schema',
      (v) => v == null
          ? null
          : TypeOrReference<Schema>.fromJson(
              v as Map,
              (value) => Schema.fromJson(value as Map),
            ),
    ),
    content: $checkedConvert(
      'content',
      (v) => (v as Map?)?.map(
        (k, e) => MapEntry(k as String, MediaType.fromJson(e as Map)),
      ),
    ),
    example: $checkedConvert('example', (v) => v),
    examples: $checkedConvert(
      'examples',
      (v) => (v as Map?)?.map(
        (k, e) => MapEntry(
          k as String,
          TypeOrReference<Example>.fromJson(
            e as Map,
            (value) => Example.fromJson(value as Map),
          ),
        ),
      ),
    ),
    extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
  );
  return val;
});

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
  'description': ?instance.description,
  'required': instance.required,
  'deprecated': instance.deprecated,
  'allowEmptyValue': instance.allowEmptyValue,
  'style': instance.style,
  'explode': ?instance.explode,
  'allowReserved': instance.allowReserved,
  'schema': ?instance.schema?.toJson((value) => value.toJson()),
  'content': ?instance.content?.map((k, e) => MapEntry(k, e.toJson())),
  'example': ?instance.example,
  'examples': ?instance.examples?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'extensions': ?instance.extensions,
};

Link _$LinkFromJson(Map json) =>
    $checkedCreate('Link', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'operationId',
          'operation_ref',
          'parameters',
          'requestBody',
          'description',
          'server',
        ],
      );
      final val = Link(
        operationId: $checkedConvert('operationId', (v) => v as String?),
        operationRef: $checkedConvert('operation_ref', (v) => v as String?),
        parameters: $checkedConvert(
          'parameters',
          (v) => (v as Map?)?.map((k, e) => MapEntry(k as String, e)),
        ),
        requestBody: $checkedConvert('requestBody', (v) => v),
        description: $checkedConvert('description', (v) => v as String?),
        server: $checkedConvert(
          'server',
          (v) => v == null ? null : Server.fromJson(v as Map),
        ),
      );
      return val;
    }, fieldKeyMap: const {'operationRef': 'operation_ref'});

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
  'operationId': ?instance.operationId,
  'operation_ref': ?instance.operationRef,
  'parameters': ?instance.parameters,
  'requestBody': ?instance.requestBody,
  'description': ?instance.description,
  'server': ?instance.server?.toJson(),
};

Encoding _$EncodingFromJson(Map json) => $checkedCreate('Encoding', json, (
  $checkedConvert,
) {
  final val = Encoding(
    contentType: $checkedConvert('contentType', (v) => v as String?),
    headers: $checkedConvert(
      'headers',
      (v) => (v as Map?)?.map(
        (k, e) => MapEntry(
          k as String,
          TypeOrReference<Header>.fromJson(
            e as Map,
            (value) => Header.fromJson(value as Map),
          ),
        ),
      ),
    ),
    style: $checkedConvert('style', (v) => v as String?),
    explode: $checkedConvert('explode', (v) => v as bool?),
    allowReserved: $checkedConvert('allowReserved', (v) => v as bool? ?? false),
    extensions: $checkedConvert('extensions', (v) => extractExtensions(v)),
  );
  return val;
});

Map<String, dynamic> _$EncodingToJson(Encoding instance) => <String, dynamic>{
  'contentType': ?instance.contentType,
  'headers': ?instance.headers?.map(
    (k, e) => MapEntry(k, e.toJson((value) => value.toJson())),
  ),
  'style': ?instance.style,
  'explode': ?instance.explode,
  'allowReserved': instance.allowReserved,
  'extensions': ?instance.extensions,
};
