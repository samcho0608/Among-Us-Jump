part of 'character_cubit.dart';

@immutable
abstract class CharacterState {
  static const double initialHeight = 1.0;
  final double yCoordinate;
  final bool isAlive;
  final String path;

  const CharacterState({
    required this.yCoordinate,
    required this.isAlive,
    required this.path,
  });
}

class CharacterStill extends CharacterState {
  const CharacterStill({
    String path = 'assets/images/among_us_characters/among_us_character_red.png'
  }) :
      super(
        yCoordinate: 1.0,
        isAlive: true,
        path: path
      );
}

class CharacterJumping extends CharacterState {
  const CharacterJumping({
    required double yCoordinate,
    required String path
  }) :
      super(
        yCoordinate: yCoordinate,
        isAlive: true,
        path: path
      );
}

class CharacterDead extends CharacterState {
  const CharacterDead({
    required double yCoordinate,
    required String path,
  }) :
      super(
        yCoordinate: yCoordinate,
        isAlive: false,
        path: path
      );

}
