import 'dart:async';

import 'package:among_us_jump/constants.dart';
import 'package:among_us_jump/screens/game/widgets/game_objects/game_object.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  Duration duration;
  final _player = AudioPlayer();


  CharacterCubit({required this.duration}) : super(const CharacterStill());

  Future<void> playJumpSound() async {
    await _player.setAsset('assets/audio/jump.mp3');
    _player.play();
  }

  void changeColor(String path) {
    emit(CharacterStill(path: path));
  }

  void update() {
    double elapsedSeconds = duration.inMilliseconds / 100;

    if(state.velY != 0){
      double dispY = state.dispY + state.velY * elapsedSeconds;
      if (dispY < 0) {
        emit(CharacterStill(path: state.path));
      } else {
        emit(CharacterJumping(
            dispY: dispY,
            velY: state.velY - 45 * elapsedSeconds,
            path: state.path)
        );
      }
    }

  }

  void jump({bool isShort = true}) {
    playJumpSound();
    if(state is CharacterStill) {
      emit(CharacterJumping(dispY: 0, velY: isShort ? 100 : 125, path: state.path));
    }
  }

  void died(int minutes, int seconds) {
    SharedPreferences.getInstance().then(
            (prefs) {
              int? originalHighMin = prefs.getInt(HIGH_MIN);
              int? originalHighSec = prefs.getInt(HIGH_SEC);
              if([originalHighSec,originalHighSec].any((e) => e == null) ||
              originalHighMin! < minutes ||
                  originalHighMin == minutes && originalHighSec! < seconds)
                {
                  prefs.setInt(HIGH_MIN, minutes);
                  prefs.setInt(HIGH_SEC, seconds);
                }
            }
    );
    emit(CharacterDead(path: state.path));
  }

  void restart() {
    emit(CharacterStill(path: state.path));
  }
}
