import 'package:flutter/material.dart';

import '../game_object_cubit.dart';

part 'character.dart';

class CharacterCubit extends GameObjectCubit<Character> {
  CharacterCubit({required Sprite sprite}) : super(Character(sprite: sprite,));

  void changeColor(String path) {
    emit(
        Character(
            sprite: Sprite(
                imagePath: path,
                imageHeight: state.sprite.imageHeight,
                imageWidth: state.sprite.imageWidth
            )
        )
    );
  }

  @override
  void update(Duration duration) {
    double elapsedSeconds = duration.inMilliseconds / 100;

    if(state.velY != 0){
      double nextDy = state.dY + state.velY * elapsedSeconds;
      if (nextDy < 0) {
        emit(Character(sprite: state.sprite,));
      } else {
        emit(
          Character(
              sprite: state.sprite,
              dY: nextDy,
              velY: state.velY - 45 * elapsedSeconds
          )
        );
      }
    }
  }

  void jump({bool isShort = true}) {
    // TODO:: add sound effect
    // playJumpSound();
    if(state.velY == 0){
      emit(Character(
        sprite: state.sprite,
        dY: 0,
        velY: isShort ? 100 : 125,
      ));
    }
  }
}