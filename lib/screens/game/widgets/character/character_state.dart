part of 'character_cubit.dart';

@immutable
abstract class CharacterState {
  static const double initialHeight = 1.0;
  final double yCoordinate;
  final bool isAlive;

  const CharacterState({
    required this.yCoordinate,
    required this.isAlive,
  });
}

class CharacterStill extends CharacterState {
  const CharacterStill() :
      super(
        yCoordinate: 1.0,
        isAlive: true,
      );
}

class CharacterJumping extends CharacterState {
  const CharacterJumping({required double yCoordinate}) :
      super(
          yCoordinate: yCoordinate,
          isAlive: true
      );
}

class CharacterDead extends CharacterState {
  const CharacterDead(double yCoordinate) :
      super(
        yCoordinate: yCoordinate,
        isAlive: true
      );

}
