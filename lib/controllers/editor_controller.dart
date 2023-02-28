import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainstack/enums/social_media_enum.dart';
import 'package:mainstack/model/editor_model.dart';
import 'package:mainstack/model/link_model.dart';
import 'package:mainstack/utils/constants.dart';
import 'package:mainstack/widgets/select_image_dialog.dart';

import '../model/text_model.dart';
import '../utils/pick_image.dart';

class EditorController extends GetxController {
  final Rx<EditorModel?> _editorModel = Rx<EditorModel?>(null);

  EditorModel? get editorModel  => _editorModel.value;

  set editorModel (EditorModel? model) => _editorModel.value = model;

  final _name = 'Your name here'.obs;
  final _bio = 'Your bio goes here'.obs;
  final Rx<File?> _headerImage = Rx<File?>(null);
  final Rx<File?> _image = Rx<File?>(null);
  final titles = <String>[].obs;
  final socialMedia = <String, String>{}.obs;

  String get name => _name.value;

  set name(String value) => _name.value = value;

  String get bio => _bio.value;

  set bio(String value) => _bio.value = value;

  File? get headerImage => _headerImage.value;

  set headerImage(File? value) => _headerImage.value = value;

  File? get image => _image.value;

  set image(File? value) => _image.value = value;

  List<String> get applicableTitles {
    final list = [
      'Agency',
      'Analyst',
      'Artist',
      'Developer',
      'Engineer',
      'Education',
      'Author',
      'Blogger',
      'Coach',
      'Consultant',
      'Entrepreneur',
      'Researcher' 'Public Speaker',
      'Social Media Manager',
      'Publisher'
    ];
    list.sort((a, b) => a.compareTo(b));
    return list;
  }

  void searchTitles(String val) {}

  List<String> media = [
    Constants.facebook,
    Constants.twitter,
    Constants.instagram,
    Constants.linkedIn,
    Constants.telegram,
    Constants.whatsapp
  ];

  void addMedia(String media) {
    SocialMedia social = SocialMediaMap.fromString(media)!;
    if (socialMedia.containsKey(social.value!)) {
      socialMedia.remove(social.value!);
      return;
    }
    socialMedia[social.value!] = '';
  }

  void pickHeaderImage() {
    showDialog(context: Get.context!, builder: (_) => const SelectImageDialog())
        .then((value) async {
      if (value == 'gallery') {
        File? image = await pickImage(source: ImageSource.gallery);
        if (image != null) {
          headerImage = image;
        }
      }
      if (value == 'camera') {
        File? image = await pickImage(source: ImageSource.camera);
        if (image != null) {
          headerImage = image;
        }
      }
    });
  }

  void pickProfileImage() {
    showDialog(context: Get.context!, builder: (_) => const SelectImageDialog())
        .then((value) async {
      if (value == 'gallery') {
        File? image = await pickImage(source: ImageSource.gallery);
        if (image != null) {
          this.image = image;
        }
      }
      if (value == 'camera') {
        File? image = await pickImage(source: ImageSource.camera);
        if (image != null) {
          this.image = image;
        }
      }
    });
  }
  void addLinks(List<LinkModel> links){
    editorModel = editorModel!.copyWith(links: links);
  }

  void addText(TextModel text){
    editorModel = editorModel!.copyWith(text: text);
  }
  @override
  void onInit() {
    super.onInit();
    editorModel = EditorModel(
      name: name,
      bio: bio,
      titles: titles,
      socialMedia: socialMedia,
    );
  }
}
