import 'dart:async';

import 'package:among_us_jump/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  Duration duration;
  final _player = AudioPlayer();
  double shortJumpVelocity = 4.5;
  double longJumpVelocity = 6.5;


  CharacterCubit({required this.duration}) : super(const CharacterStill());

  Future<void> playJumpSound() async {
    await _player.setAsset('assets/audio/jump.mp3');
    _player.play();
  }

  void changeColor(String path) {
    emit(CharacterStill(path: path));
  }

  void jump(double velocity) {
    double time = 0.0;
    Timer.periodic(duration, (timer) {
      if(state is CharacterDead) {
        timer.cancel();
      }
      time += 0.03;
      double targetY =
          CharacterState.initialHeight - (-4.9 * time * time + velocity * time);
      if(targetY >= CharacterState.initialHeight) {
        targetY = 1.0;
        emit(CharacterStill(path: state.path));
        timer.cancel();
      }
      else {
        emit(CharacterJumping(
          yCoordinate: targetY,
          path: state.path
        ));
      }
    });

  }

  void shortJump() {
    if(state is CharacterStill) {
      playJumpSound();
      jump(shortJumpVelocity);
    }
  }

  void longJump() {
    if(state is CharacterStill) {
      playJumpSound();
      jump(longJumpVelocity);
    }
  }

  void died(int minutes, int seconds) {
    SharedPreferences.getInstance().then(
            (prefs) {
              int? originalHighMin = prefs.getInt(highMin);
              int? originalHighSec = prefs.getInt(highSec);
              if([originalHighSec,originalHighSec].any((e) => e == null) ||
              originalHighMin! < minutes ||
                  originalHighMin == minutes && originalHighSec! < seconds)
                {
                  prefs.setInt(highMin, minutes);
                  prefs.setInt(highSec, seconds);
                }
            }
    );
    emit(CharacterDead(yCoordinate: state.yCoordinate, path: state.path));
  }

  void restart() {
    emit(CharacterStill(path: state.path));
  }
}
