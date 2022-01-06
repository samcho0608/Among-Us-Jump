part of 'game_object_cubit.dart';

@immutable
abstract class GameObject {
  final Sprite sprite;
  final double dX, dY, velX, velY;

  const GameObject({
    required this.sprite,
    this.dX = 0,
    this.dY = 0,
    this.velY = 0,
    this.velX = 0,
  });

  Rect getRect(Size screenSize);
}
