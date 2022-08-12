import 'package:flutter/cupertino.dart';
import 'independent_class.dart';
import 'models.dart';

class DependentClass extends ChangeNotifier {
  DependentClass({required this.watchIndependentClassStateProviderValue});

  IndependentClass watchIndependentClassStateProviderValue;

  late ScreenButton _screenButton = ScreenButton(
      screenButtonColor:
          invert(watchIndependentClassStateProviderValue.screen.screenColor!),
      screenButtonText: 'Click to switch colors');
  ScreenButton get screenButton => _screenButton;

  initialiseScreenButton() {
    _screenButton = ScreenButton(
        screenButtonColor:
            invert(watchIndependentClassStateProviderValue.screen.screenColor!),
        screenButtonText: 'Click to switch colors');
  }

  onButtonOnTap() {
    watchIndependentClassStateProviderValue.updateScreen(
        screen: Screen(
            screenColor: _screenButton.screenButtonColor,
            screenText:
                watchIndependentClassStateProviderValue.screen.screenText));
  }
}

Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;

  return Color.fromARGB((color.opacity * 255).round(), r, g, b);
}
