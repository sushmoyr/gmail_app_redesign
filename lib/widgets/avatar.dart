import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.width = 24,
    this.cornerRadius = 0,
    required this.child,
  }) : super(key: key);
  final double width;
  final double cornerRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width,
      height: width,
      child: child,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
    );
  }
}
