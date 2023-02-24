class TextModel {
  final String header;
  final String body;

  TextModel({
    required this.header,
    required this.body,
  });

  TextModel copyWith({
    String? header,
    String? body,
  }) {
    return TextModel(
      header: header ?? this.header,
      body: body ?? this.body,
    );
  }
}
