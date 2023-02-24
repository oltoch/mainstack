import 'package:get/get.dart';

import 'package:mainstack/widgets/texts.dart' as text;

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;

  final Rx<text.FontStyle> _textStyle = text.FontStyle.poppins.obs;

  final Rx<text.FontStyle> _headingStyle = text.FontStyle.poppins.obs;

  final Rx<ButtonType> _buttonType = ButtonType.solidRounded.obs;

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
}

enum ButtonType{
  solidRounded, lightRounded, solidSquare, lightSquare, solidCurved, lightCurved
}