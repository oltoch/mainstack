import 'dart:io';

import 'package:get/get.dart';

class EditorController extends GetxController {

final _name = ''.obs;
final _bio = ''.obs;
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
}