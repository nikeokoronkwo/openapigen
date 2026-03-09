import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';

final baseLogger = Logger('OpenAPIGen');
final verboseLogger = Logger('OpenAPIGen.verbose');

void _stdoutWrite(String message) {
  print(message);
}

void _stderrWrite(String message) {
  stderr.write(message);
}

void _streamWrite(StreamSink<String> stream, String message) {
  stream.add(message);
}

/// Base stdout listener for logging, can be extended or replaced by users of this package
void stdoutListener(LogRecord record) {
  final time = record.time.toIso8601String();
  final level = record.level.name;
  final message = record.message;
  _stdoutWrite('[$time] [$level] $message');
}

void verboseStdoutListener(LogRecord record) {
  final time = record.time.toIso8601String();
  final level = record.level.name;
  final message = record.message;
  final error = record.error != null ? ' Error: ${record.error}' : '';
  final stackTrace = record.stackTrace != null
      ? ' StackTrace: ${record.stackTrace}'
      : '';
  final zone = record.zone != null ? 'Zone: ${record.zone}' : '';
  final seqNo = record.sequenceNumber;

  _stdoutWrite('[$time] [$level] ($seqNo)@$zone $message$error$stackTrace');
}
