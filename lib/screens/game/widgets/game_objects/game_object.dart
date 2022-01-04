import 'package:flutter/material.dart';

class Sprite {
  final String imagePath;
  final int imageWidth, imageHeight;

  const Sprite({
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight
  });
}

abstract class GameObject extends StatelessWidget{
  const GameObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
  Rect getRect(BuildContext context, Size screenSize);
}
