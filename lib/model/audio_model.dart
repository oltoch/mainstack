class AudioModel {
  final bool hasHeading;
  final String? title;
  final String link;
  final AudioPlatform platform;

  const AudioModel(
      {this.hasHeading = false,
      this.title,
      required this.link,
      this.platform = AudioPlatform.spotify})
      :
        //Assert that title is not null if hasHeading is true
        assert(hasHeading == false || title != null,
            'title cannot be null if hasHeading is true');

  AudioModel copyWith({
    bool? hasHeading,
    String? title,
    String? link,
    AudioPlatform? platform,
  }) =>
      AudioModel(
        hasHeading: hasHeading ?? this.hasHeading,
        title: title ?? this.title,
        link: link ?? this.link,
        platform: platform ?? this.platform,
      );
}

enum AudioPlatform { spotify, soundCloud, appleMusic, youtubeMusic, tidal }
