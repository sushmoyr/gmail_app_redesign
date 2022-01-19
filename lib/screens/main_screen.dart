import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gmail_app_redesign/controllers/background_selector_controller.dart';
import 'package:gmail_app_redesign/data/models/user.dart';
import 'package:gmail_app_redesign/widgets/background_selector.dart';
import 'package:gmail_app_redesign/widgets/drawer.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final BackgroundSelectorController _backgroundSelector =
      BackgroundSelectorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.black,
      drawer: SideDrawer(
        onThemeChooserClick: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (ctx) =>
                BackgroundSelector(controller: _backgroundSelector),
          );
        },
      ),
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Background(
            controller: _backgroundSelector,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                HomeAppBar(
                  onMenuPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  final VoidCallback onMenuPressed;
  const HomeAppBar({
    Key? key,
    required this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 12,
          sigmaY: 12,
        ),
        child: Container(
          color: Colors.white.withOpacity(0.05),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: onMenuPressed,
                ),
                trailing: Avatar(
                  width: 30,
                  cornerRadius: 4,
                  child: Image.network(
                    users[0].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 36,
                        child: Image.asset('assets/logo.png'),
                      ),
                      Text('Gmail'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
