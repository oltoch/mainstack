class VideoModel {
  final bool hasHeading;
  final String? title;
  final String link;
  final VideoPlatform platform;

  const VideoModel(
      {this.hasHeading = false,
      this.title,
      required this.link,
      this.platform = VideoPlatform.youtube})
      :
        //Assert that title is not null if hasHeading is true
        assert(hasHeading == false || title != null,
            'title cannot be null if hasHeading is true');

  VideoModel copyWith({
    bool? hasHeading,
    String? title,
    String? link,
    VideoPlatform? platform,
  }) =>
      VideoModel(
        hasHeading: hasHeading ?? this.hasHeading,
        title: title ?? this.title,
        link: link ?? this.link,
        platform: platform ?? this.platform,
      );
}

enum VideoPlatform { youtube, vimeo, twitch }
