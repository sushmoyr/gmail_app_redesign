import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key, this.onThemeChooserClick}) : super(key: key);

  final VoidCallback? onThemeChooserClick;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height,
          color: Colors.white.withOpacity(0.05),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          width: 36,
                          height: 36,
                          child: Image.asset('assets/logo.png')),
                      Text(
                        'Gmail',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  indent: 8,
                ),
                ListTile(
                  leading: Icon(Icons.inbox),
                  title: Text('Primary'),
                ),
                ListTile(
                  leading: Icon(LineariconsFree.users),
                  title: Text('Social'),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.tag),
                  title: Text('Promotions'),
                ),
                Divider(
                  color: Colors.white,
                  indent: 8,
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.star),
                  title: Text('Starred'),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.alarm),
                  title: Text('Snoozed'),
                ),
                ListTile(
                  leading: Icon(Icons.label_outlined),
                  title: Text('Important'),
                ),
                ListTile(
                  leading: Icon(Icons.send_outlined),
                  title: Text('Sent'),
                ),
                ListTile(
                  leading: Icon(FontAwesome.doc),
                  title: Text('Draft'),
                ),
                ListTile(
                  leading: Icon(FontAwesome5.envelope_open),
                  title: Text('Outbox'),
                ),
                ListTile(
                  leading: Icon(Icons.all_inbox),
                  title: Text('All mails'),
                ),
                ListTile(
                  leading: Icon(LineariconsFree.warning),
                  title: Text('Spam'),
                ),
                ListTile(
                  leading: Icon(Icons.delete_outlined),
                  title: Text('Trash'),
                ),
                Divider(
                  color: Colors.white,
                  indent: 8,
                ),
                ListTile(
                  leading: Icon(Icons.format_paint),
                  title: Text('Background'),
                  onTap: onThemeChooserClick,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
