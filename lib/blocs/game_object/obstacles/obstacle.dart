part of 'obstacle_cubit.dart';

const double defaultSpeed = 50;

abstract class Obstacle extends GameObject {
  const Obstacle({
    required Sprite sprite,
    required double dX,
    required double velX,
  }) : super(
      sprite: sprite,
      dX: dX,
      velX: velX
  );

  @override
  Rect getRect(Size screenSize) {
    return Rect.fromLTWH(
        screenSize.width - 10 - dX,
        screenSize.height * 3 / 4
            - sprite.imageHeight,
        sprite.imageWidth.toDouble(),
        sprite.imageHeight.toDouble()
    );
  }

  factory Obstacle.random() {
    switch(Random().nextInt(4)) {
      case 0:
        return const Rock();
      case 1:
        return const ImposterGun();
      default:
        return const ImposterGun();
    }
  }
}

class Rock extends Obstacle {
  const Rock({
    double dX = 0
  })
      : super(
    sprite: const Sprite(
        imagePath: 'assets/images/among_us_rock.png',
        imageWidth: 80,
        imageHeight: 40
    ),
    dX: dX,
    velX: defaultSpeed,
  );
}

class ImposterGun extends Obstacle {
  const ImposterGun({
    double dX = 0
  })
      : super(
    sprite: const Sprite(
        imagePath: 'assets/images/among_us_imposter_gun.png',
        imageWidth: 130,
        imageHeight: CHARACTER_HEIGHT - 10
    ),
    dX: dX,
    velX: defaultSpeed,
  );
}