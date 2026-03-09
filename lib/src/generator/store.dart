import 'package:code_builder/code_builder.dart' as code;
import 'package:collection/collection.dart';

import '../spec/json_schema.dart';

/// A store of generated interfaces to their generations to prevent
/// recomputations
final EqualityMap<Schema, code.Class> componentsStore = EqualityMap(
  EqualityBy((e) => e.title ?? e),
);

final EqualityMap<Schema, code.Enum> enumsStore = EqualityMap(
  EqualityBy((e) => e.title ?? e),
);

int anonymousCounter = 0;

late final Map<String, dynamic> openApiJson;

final Map<String, dynamic> resolvedComponentsObject = {};
