part of 'character_cubit.dart';

@immutable
abstract class CharacterState {
  final double dispY, velY;
  final bool isAlive;
  final String path;

  const CharacterState({
    this.dispY = 0,
    this.velY = 0,
    this.isAlive = true,
    required this.path,
  });
}

class CharacterStill extends CharacterState {
  const CharacterStill({
    String path = 'assets/images/among_us_characters/among_us_character_red.png'
  }) :
      super(
        isAlive: true,
        path: path
      );
}

class CharacterJumping extends CharacterState {
  const CharacterJumping({
    required double dispY,
    required double velY,
    required String path,
  }) :
      super(
        dispY: dispY,
        velY: velY,
        isAlive: true,
        path: path
      );
}

class CharacterDead extends CharacterState {
  const CharacterDead({
    required String path,
  }) :
      super(
        dispY: 0,
        isAlive: false,
        path: path
      );

}
