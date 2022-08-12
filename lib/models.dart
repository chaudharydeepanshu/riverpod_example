import 'package:flutter/cupertino.dart';

class Screen {
  Color? screenColor;
  String? screenText;

  Screen({this.screenColor, this.screenText});
}

class ScreenButton {
  Color screenButtonColor;
  String screenButtonText;

  ScreenButton(
      {required this.screenButtonColor, required this.screenButtonText});
}
