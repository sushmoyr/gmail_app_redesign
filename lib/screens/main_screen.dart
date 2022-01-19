import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gmail_app_redesign/controllers/background_selector_controller.dart';
import 'package:gmail_app_redesign/data/models/email.dart';
import 'package:gmail_app_redesign/widgets/avatar.dart';
import 'package:gmail_app_redesign/widgets/background.dart';
import 'package:gmail_app_redesign/widgets/background_selector.dart';
import 'package:gmail_app_redesign/widgets/drawer.dart';
import 'package:gmail_app_redesign/widgets/home_appbar.dart';

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
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                HomeAppBar(
                  onMenuPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                ListView.separated(
                  itemBuilder: _emailItemsBuilder,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: _separatorBuilder,
                  shrinkWrap: true,
                  itemCount: emails.length,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _emailItemsBuilder(BuildContext context, int position) {
    Email email = emails[position];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                email.sender.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    email.subject,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    email.body,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white.withAlpha(180),
                        ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              leading: Avatar(
                cornerRadius: 8,
                child: Image.network(
                  email.sender.imageUrl,
                  fit: BoxFit.cover,
                ),
                width: 48,
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: [
                    Text('${email.time.day}/${email.time.month}'),
                    Spacer(),
                    email.starred
                        ? Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        : Icon(Icons.star_outlined),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _separatorBuilder(BuildContext context, int position) {
    return SizedBox(
      height: 16,
    );
  }
}
