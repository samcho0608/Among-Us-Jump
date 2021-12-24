import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  Duration duration;
  final _player = AudioPlayer();

  CharacterCubit({required this.duration}) : super(const CharacterStill());

  Future<void> playJumpSound() async {
    await _player.setAsset('assets/audio/jump.mp3');
    _player.play();
  }

  void jump() {
    double time = 0.0;
    if(state is CharacterStill) {
      playJumpSound();
      Timer.periodic(duration, (timer) {
        time += 0.01;
        double targetY =
            CharacterState.initialHeight - (-4.9 * time * time + 4.5 * time);
        if(targetY >= CharacterState.initialHeight) {
          targetY = 1.0;
          emit(const CharacterStill());
          timer.cancel();
        }
        else {
          emit(CharacterJumping(
              yCoordinate: targetY
          ));
        }
      });
    }
  }
}
