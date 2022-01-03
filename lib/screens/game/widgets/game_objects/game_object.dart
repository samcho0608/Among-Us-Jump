import 'package:flutter/material.dart';

class Sprite {
  String imagePath;
  int imageWidth, imageHeight;

  Sprite({
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight
  });
}

abstract class GameObject extends StatelessWidget{
  const GameObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
  Rect getRect(Size screenSize);
  void update(Duration lastTime, Duration elapsedTime) {}
}
