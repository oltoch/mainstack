import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

///A function to select image from the device.
///Images can either be from the gallery or from the camera
Future<File?> pickImage({required ImageSource source}) async {
  File? file;
  try {
    final image =
    await ImagePicker().pickImage(source: source, imageQuality: 15);
    if (image != null) {
      //Converting XFile that is returned by Image Picker plugin to File
      file = File(image.path);
    }
  } on PlatformException catch (e) {

    Permission.storage.request();
    Permission.camera.request();
  }
  return file;
}