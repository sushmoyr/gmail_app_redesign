import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      animationController: BottomSheet.createAnimationController(this),
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(60),
          color: Colors.grey,
          width: MediaQuery.of(context).size.width,
          child: Text('Hello World'),
        );
      },
    );
  }
}
