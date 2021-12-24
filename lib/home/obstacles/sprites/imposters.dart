import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImposterVent extends StatelessWidget {
  const ImposterVent({Key? key}) : super(key: key);
  final path = 'assets/images/among_us_imposter_vent.gif';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 80,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: Image.asset(path)
        )
    );
  }
}

class ImposterGun extends StatelessWidget {
  const ImposterGun({Key? key}) : super(key: key);
  final path = 'assets/images/among_us_imposter_gun.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 80,
        child: Image.asset(path)
    );
  }
}

class ImposterAlien extends StatelessWidget {
  const ImposterAlien({Key? key}) : super(key: key);
  final path = 'assets/images/among_us_imposter_alien.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 80,
        child: Image.asset(path)
    );
  }
}