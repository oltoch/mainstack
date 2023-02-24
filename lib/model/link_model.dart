class LinkModel {
  final String title;
  final String link;

  LinkModel({
    required this.title,
    required this.link,
  });

  LinkModel copyWith({
    String? title,
    String? link,
  }) =>
      LinkModel(
        title: title ?? this.title,
        link: link ?? this.link,
      );
}
