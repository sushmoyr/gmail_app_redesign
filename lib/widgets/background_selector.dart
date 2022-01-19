import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gmail_app_redesign/controllers/background_selector_controller.dart';

class BackgroundSelector extends StatefulWidget {
  const BackgroundSelector({Key? key, required this.controller})
      : super(key: key);

  final BackgroundSelectorController controller;

  @override
  State<BackgroundSelector> createState() => _BackgroundSelectorState();
}

class _BackgroundSelectorState extends State<BackgroundSelector> {
  @override
  Widget build(BuildContext context) {
    List<String> images = BackgroundSelectorController.backgrounds;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 8,
          sigmaX: 8,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            top: 48,
            left: 20,
            right: 20,
          ),
          color: Colors.white.withOpacity(0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Background',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (ctx, pos) {
                    String image = images[pos];
                    double border =
                        (widget.controller.selectedAsset == image) ? 4 : 0;
                    return BorderImage(
                      border: border,
                      image: image,
                      onClick: () {
                        widget.controller.selectBackground(pos);
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderImage extends StatelessWidget {
  const BorderImage({
    Key? key,
    required this.border,
    required this.image,
    required this.onClick,
  }) : super(key: key);
  final double border;
  final String image;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(border),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.8),
          /*border: Border.all(
                        width: 4,
                        color: Colors.white.withOpacity(0.5),
                      ),*/
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
