import 'package:flutter/material.dart';
import 'package:gmail_app_redesign/controllers/background_selector_controller.dart';

class Background extends StatefulWidget {
  const Background({Key? key, required this.controller}) : super(key: key);
  final BackgroundSelectorController controller;

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  late String backgroundImage;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        backgroundImage = widget.controller.selectedAsset;
      });
    });
    backgroundImage = widget.controller.selectedAsset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      backgroundImage,
      fit: BoxFit.cover,
    );
  }
}
