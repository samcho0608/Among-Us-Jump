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
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: buildObstacle()
        ),
        Expanded(child: Container())
      ],
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
