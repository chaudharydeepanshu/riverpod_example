import 'package:flutter/material.dart';
import 'package:riverpod_example/models.dart';

class IndependentClass extends ChangeNotifier {
  late Screen _screen;
  Screen get screen => _screen;

  initialiseScreenFromCreator({Screen? screen}) {
    _screen = Screen(
        screenColor: screen?.screenColor ?? Colors.orange,
        screenText: screen?.screenText ?? "Default Text");
  }

  updateScreen({required Screen screen}) {
    _screen = screen;

    notifyListeners();
  }
}
