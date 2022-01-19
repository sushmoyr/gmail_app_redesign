import 'package:flutter/cupertino.dart';

class BackgroundSelectorController extends ChangeNotifier {
  static const List<String> backgrounds = [
    "assets/backgrounds/theme1.png",
    "assets/backgrounds/theme2.png",
    "assets/backgrounds/theme3.jpg",
    "assets/backgrounds/theme4.png",
  ];

  String selectedAsset = backgrounds[0];

  void selectBackground(int index) {
    assert(index < backgrounds.length, 'index out of range');
    selectedAsset = backgrounds[index];
    notifyListeners();
  }
}
