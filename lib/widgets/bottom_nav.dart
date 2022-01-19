import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedBottomNavigation extends StatefulWidget {
  const AnimatedBottomNavigation({Key? key, required this.controller})
      : super(key: key);
  final ScrollController controller;

  @override
  _AnimatedBottomNavigationState createState() =>
      _AnimatedBottomNavigationState();
}

class _AnimatedBottomNavigationState extends State<AnimatedBottomNavigation> {
  double bottomOffset = 0;
  double bottomDiff = 1;
  double lastScrollOffset = 0;
  @override
  void initState() {
    widget.controller.addListener(() {
      //debugPrint(widget.controller.offset.toString());

      double scrollOffset = widget.controller.offset;

      if (scrollOffset >= 0) {
        if (scrollOffset != lastScrollOffset) {
          setState(() {
            bottomOffset += ((scrollOffset - lastScrollOffset) * 0.5);
            lastScrollOffset = scrollOffset;

            if (bottomOffset < 0) {
              bottomOffset = 0;
            }
            if (bottomOffset > 60) {
              bottomOffset = 60;
            }
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -bottomOffset,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.mail),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.create),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.videocam_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
