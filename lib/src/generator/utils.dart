import 'dart:convert';

String? docsFrom({String? summary, String? description}) {
  if (summary == null && description == null) return null;

  final StringBuffer buffer = StringBuffer();
  const LineSplitter splitter = LineSplitter();

  if (summary != null) {
    buffer.writeAll(splitter.convert(summary).map((e) => '/// $e'), '\n');
    if (description != null) buffer.writeln('///');
  }

  if (description != null) {
    buffer.writeAll(splitter.convert(description).map((e) => '/// $e'), '\n');
  }

  return buffer.toString();
}

String toCamelCase(List<String> words) {
  if (words.isEmpty) return '';

  final buffer = StringBuffer();
  for (var i = 0; i < words.length; i++) {
    final word = words[i];
    if (i == 0) {
      buffer.write(word.toLowerCase());
    } else {
      buffer.write(word[0].toUpperCase());
      buffer.write(word.substring(1).toLowerCase());
    }
  }
  return buffer.toString();
}
