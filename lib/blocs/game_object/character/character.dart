part of 'character_cubit.dart';

@immutable
class Character extends GameObject {

  const Character({
    required Sprite sprite,
    double dY = 0,
    double velY = 0,
  }) : super(
      sprite: sprite,
      dY: dY,
      velY: velY
  );

  @override
  Rect getRect(Size screenSize) {
    return Rect.fromLTWH(
        screenSize.width / 10,
        screenSize.height * 3 / 4
            - sprite.imageHeight
            - dY,
        sprite.imageWidth.toDouble(),
        sprite.imageHeight.toDouble()
    );
  }
}