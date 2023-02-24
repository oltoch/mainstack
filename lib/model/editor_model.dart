import 'package:mainstack/model/pdf_model.dart';

import 'audio_model.dart';
import 'mailing_model.dart';
import 'text_model.dart';

import 'image_model.dart';
import 'link_model.dart';
import 'video_model.dart';

class EditorModel {
  final String name;
  final String? bio;
  final List<String> titles;
  final String? image;
  final String? headerImage;
  final Map<String, String> socialMedia;
  final List<LinkModel>? links;
  final TextModel? text;
  final MailingModel? mailing;
  final ImageModel? imageModel;
  final List<VideoModel>? videos;
  final List<AudioModel>? audios;
  final PdfModel? pdfModel;
  final List<String>? tweets;

  const EditorModel({
    required this.name,
    this.bio,
    this.titles = const [],
    this.image,
    this.headerImage,
    this.socialMedia = const {},
    this.links,
    this.text,
    this.mailing,
    this.imageModel,
    this.videos,
    this.audios,
    this.pdfModel,
    this.tweets,
  });


  EditorModel copyWith({
    String? name,
    String? bio,
    List<String>? titles,
    String? image,
    String? headerImage,
    Map<String, String>? socialMedia,
    List<LinkModel>? links,
    TextModel? text,
    MailingModel? mailing,
    ImageModel? imageModel,
    List<VideoModel>? videos,
    List<AudioModel>? audios,
    PdfModel? pdfModel,
    List<String>? tweets,
  }) =>
      EditorModel(
        name: name ?? this.name,
        bio: bio ?? this.bio,
        titles: titles ?? this.titles,
        image: image ?? this.image,
        headerImage: headerImage ?? this.headerImage,
        socialMedia: socialMedia ?? this.socialMedia,
        links: links ?? this.links,
        text: text ?? this.text,
        mailing: mailing ?? this.mailing,
        imageModel: imageModel ?? this.imageModel,
        videos: videos ?? this.videos,
        audios: audios ?? this.audios,
        pdfModel: pdfModel ?? this.pdfModel,
        tweets: tweets ?? this.tweets,
      );
}
