import 'package:json_annotation/json_annotation.dart';

part 'shared.g.dart';

/// Extracts OpenAPI vendor extensions (x-* fields) from JSON
Map<String, dynamic>? extractExtensions(Object? json) {
  if (json is! Map<String, dynamic>) return null;

  final extensions = <String, dynamic>{};
  for (final entry in json.entries) {
    if (entry.key.startsWith('x-')) {
      extensions[entry.key] = entry.value;
    }
  }
  return extensions.isEmpty ? null : extensions;
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class Reference<T> {
  final String $ref;

  Reference({required this.$ref});

  factory Reference.fromJson(Map json) => _$ReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceToJson(this);

  T resolveJson(
    Map<String, dynamic> json, {
    Map<String, dynamic>? resolutionObject,
    required T Function(Object json) fromJsonT,
  }) {
    resolutionObject ??= {};

    return resolutionObject.putIfAbsent($ref, () {
      // convert to json
      var openapiJson = json;

      // split via path
      final [_, ...parts] = $ref.split('/');
      for (final part in parts) {
        openapiJson = openapiJson[part];
      }

      return fromJsonT(openapiJson);
    });
  }
}

class TypeOrReference<T> {
  /// The actual [T] value if this union contains a concrete object
  final T? value;

  /// The reference if this union contains a reference
  final Reference<T>? reference;

  /// The fromJson converter
  final T Function(Object? json) _fromJsonT;

  const TypeOrReference._({
    this.value,
    this.reference,
    required T Function(Object? json) fromJsonT,
  }) : _fromJsonT = fromJsonT,
       assert(
         value != null || reference != null,
         'Either value or reference must be provided',
       ),
       assert(
         value == null || reference == null,
         'Only one of value or reference can be provided',
       );

  factory TypeOrReference.fromJson(
    Map json,
    T Function(Object? json) fromJsonT,
  ) {
    if (json.containsKey(r'$ref')) {
      return TypeOrReference<T>._(
        reference: Reference.fromJson(json),
        fromJsonT: fromJsonT,
      );
    } else {
      return TypeOrReference<T>._(value: fromJsonT(json), fromJsonT: fromJsonT);
    }
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    if (reference != null) {
      return reference!.toJson();
    } else {
      return toJsonT(value as T) as Map<String, dynamic>;
    }
  }

  T resolveJson(
    Map<String, dynamic> json, {
    Map<String, dynamic>? resolutionObject,
  }) {
    if (reference != null) {
      return reference!.resolveJson(
        json,
        resolutionObject: resolutionObject,
        fromJsonT: _fromJsonT,
      );
    } else {
      return value!;
    }
  }

  TypeOrReference<T> copyWith({T? value, Reference<T>? reference}) {
    return TypeOrReference<T>._(
      value: value ?? this.value,
      reference: reference ?? this.reference,
      fromJsonT: _fromJsonT,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TypeOrReference<T> &&
        other.value == value &&
        other.reference == reference;
  }

  @override
  int get hashCode {
    return Object.hash(value, reference);
  }
}

/// Extension methods to make union types easier to use
extension UnionWithReferenceExtension<T> on TypeOrReference<T> {
  /// Returns true if this union contains a concrete value of type [T]
  bool get isValue => value != null;

  /// Returns true if this union contains a reference
  bool get isReference => reference != null;

  /// Returns the concrete value if this union contains a value
  ///
  /// Throws [StateError] if this union contains a reference
  T get valueOrThrow {
    if (value != null) return value!;
    throw StateError('Expected value but got reference: ${reference!.$ref}');
  }

  /// Returns the reference if this union contains a reference
  ///
  /// Throws [StateError] if this union contains a value
  Reference get referenceOrThrow {
    if (reference != null) return reference!;
    throw StateError('Expected reference but got value: $value');
  }
}
