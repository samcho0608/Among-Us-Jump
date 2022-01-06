import 'package:among_us_jump/screens/game/game.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'game_object.dart';

class Sprite {
  final String imagePath;
  final int imageWidth, imageHeight;

  const Sprite({
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight
  });

}

abstract class GameObjectCubit<T extends GameObject> extends Cubit<T> {
  GameObjectCubit(T initialState) : super(initialState);

  void update(Duration duration);
}
