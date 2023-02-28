import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainstack/utils/app_colors.dart';

import 'package:mainstack/widgets/texts.dart' as text;

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;

  final Rx<text.FontStyle> _textStyle = text.FontStyle.poppins.obs;

  final Rx<text.FontStyle> _headingStyle = text.FontStyle.poppins.obs;

  final Rx<ButtonType> _buttonType = ButtonType.solidRounded.obs;

  final Rx<Color> _buttonColor = const Color(0xFF000000).obs;

  Color get buttonColor => _buttonColor.value;

  set buttonColor(Color value) => _buttonColor.value = value;

  ButtonType get buttonType => _buttonType.value;

  set buttonType(ButtonType value) => _buttonType.value = value;

  text.FontStyle get headingStyle => _headingStyle.value;

  set headingStyle(text.FontStyle value) => _headingStyle.value = value;

  text.FontStyle get textStyle => _textStyle.value;

  set textStyle(text.FontStyle value) => _textStyle.value = value;

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
  }

  bool get isDarkMode => _isDarkMode.value;

  final _headingExpanded = false.obs;

  bool get headingExpanded => _headingExpanded.value;

  set headingExpanded(bool value) => _headingExpanded.value = value;

  final _bodyExpanded = false.obs;

  bool get bodyExpanded => _bodyExpanded.value;

  set bodyExpanded(bool value) => _bodyExpanded.value = value;

  final _buttonExpanded = false.obs;

  bool get buttonExpanded => _buttonExpanded.value;

  set buttonExpanded(bool value) => _buttonExpanded.value = value;

  Color get textColor => isDarkMode ? kWhite:kBlack;
}

enum ButtonType{
  solidRounded, lightRounded, solidSquare, lightSquare, solidCurved, lightCurved
}