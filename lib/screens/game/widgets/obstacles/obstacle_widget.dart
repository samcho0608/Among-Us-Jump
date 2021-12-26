import 'dart:math';

import 'package:flutter/material.dart';
import 'obstacle.dart';
import 'sprites/sprites.dart';

class ObstacleWidget extends StatelessWidget {
  final Obstacle obstacle;

  const ObstacleWidget({required this.obstacle, Key? key}) :
        super(key: key);

  Widget buildObstacle() {
    switch(obstacle.type) {
      case 0:
        return Rock(xCoordinate: obstacle.xCoordinate,);
      case 1:
        return ImposterAlien(xCoordinate: obstacle.xCoordinate,);
      case 2:
        return ImposterGun(xCoordinate: obstacle.xCoordinate,);
      default:
        return ImposterVent(xCoordinate: obstacle.xCoordinate,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildObstacle();
  }
}