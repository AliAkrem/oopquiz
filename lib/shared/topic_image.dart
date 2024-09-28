import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DynamicImageSize extends StatefulWidget {
  final String imagePath;

  const DynamicImageSize({super.key, required this.imagePath});

  @override
  _DynamicImageSizeState createState() => _DynamicImageSizeState();
}

class _DynamicImageSizeState extends State<DynamicImageSize> {
  double? imageWidth;
  double? imageHeight;

  @override
  void initState() {
    super.initState();
    _getImageDimensions();
  }

  Future<void> _getImageDimensions() async {
    final Image image = Image.asset("assets/topics/${widget.imagePath}");
    final ImageStream stream = image.image.resolve(ImageConfiguration.empty);
    final Completer<ui.Image> completer = Completer<ui.Image>();

    ImageStreamListener? listener;
    listener = ImageStreamListener((ImageInfo info, bool synchronousCall) {
      completer.complete(info.image);
      stream.removeListener(listener!);
    });

    stream.addListener(listener);

    final ui.Image img = await completer.future;
    setState(() {
      imageWidth = img.width.toDouble();
      imageHeight = img.height.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: imageWidth != null && imageHeight != null
          ? Image.asset(
              "assets/topics/${widget.imagePath}",
              width: imageWidth,
              height: imageHeight,
            )
          : const CircularProgressIndicator(), 
    );
  }
}
