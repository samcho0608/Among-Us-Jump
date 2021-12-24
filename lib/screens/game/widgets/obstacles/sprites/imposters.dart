import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImposterVent extends StatelessWidget {
  const ImposterVent({required this.xCoordinate, Key? key}) : super(key: key);
  final path = 'assets/images/among_us_imposter_vent.gif';
  final double xCoordinate;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(xCoordinate, 1.6),
      child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: Image.asset(
            path,
            width: 80,
          )
      ),
    );
  }
}

class ImposterGun extends StatelessWidget {
  const ImposterGun({required this.xCoordinate, Key? key}) : super(key: key);
  final path = 'assets/images/among_us_imposter_gun.png';
  final double xCoordinate;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(xCoordinate, 1.0),
      child: Image.asset(
        path,
        width: 100,
      ),
    );
  }
}

class ImposterAlien extends StatelessWidget {
  const ImposterAlien({required this.xCoordinate, Key? key}) : super(key: key);
  final path = 'assets/images/among_us_imposter_alien.png';
  final double xCoordinate;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(xCoordinate, 1.0),
      child: Image.asset(
        path,
        width: 60,
      ),
    );
  }
}