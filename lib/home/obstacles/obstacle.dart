import 'package:flutter/material.dart';

class Obstacle extends StatelessWidget {
  const Obstacle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60,
        child: Image.asset('assets/images/among_us_rock.png')
    );  }
}
