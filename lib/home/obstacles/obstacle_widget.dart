import 'dart:math';

import 'package:among_us_jump/home/obstacles/obstacle.dart';
import 'package:among_us_jump/home/obstacles/sprites/sprites.dart';
import 'package:flutter/material.dart';

class ObstacleWidget extends StatelessWidget {
  final Obstacle obstacle;

  const ObstacleWidget({required this.obstacle, Key? key}) :
        super(key: key);

  Widget buildObstacle() {
    switch(obstacle.type) {
      case 0:
        return const Rock();
      case 1:
        return const ImposterAlien();
      case 2:
        return const ImposterGun();
      default:
        return const ImposterVent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(obstacle.xCoordinate, 1.1),
      child: SizedBox(
          width: 80,
          child: buildObstacle()
      ),
    );
  }
}


// class Obstacle extends StatefulWidget {
//   final double xCoordinate;
//
//   const Obstacle({
//     required this.xCoordinate,
//     Key? key}) : super(key: key);
//
//   @override
//   _ObstacleState createState() => _ObstacleState();
// }
//
// class _ObstacleState extends State<Obstacle> {
//   late double xCoordinate;
//
//   @override
//   void initState() {
//     super.initState();
//     xCoordinate = widget.xCoordinate;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment(xCoordinate, 1.0),
//       child: SizedBox(
//           width: 60,
//           child: Image.asset('assets/images/among_us_rock.png')
//       ),
//     );
//   }
// }
