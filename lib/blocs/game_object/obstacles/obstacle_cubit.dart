import 'dart:math';

import 'package:among_us_jump/blocs/game_object/game_object_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'obstacle.dart';

class ObstacleCubit extends GameObjectCubit<Obstacle> {
  ObstacleCubit() : super(Obstacle.random());

  @override
  void update(Duration duration) {
    double elapsedSeconds = duration.inMilliseconds / 100;



    switch(state.runtimeType) {
      case Rock:
        emit(Rock(dX: state.dX + state.velX * elapsedSeconds));
        break;
      default:
        // TODO:: fix this after implementing imposter classes
        emit(Rock(dX: state.dX + state.velX * elapsedSeconds));
        break;
    }
  }}
