import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gmail_app_redesign/data/models/user.dart';

import 'avatar.dart';

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
