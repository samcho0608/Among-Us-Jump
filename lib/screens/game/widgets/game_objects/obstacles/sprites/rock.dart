import 'package:flutter/material.dart';

class Rock extends StatelessWidget {
  const Rock({required this.xCoordinate, Key? key}) : super(key: key);
  final path = 'assets/images/among_us_rock.png';
  final double xCoordinate;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(xCoordinate, 1.6),
      child: Image.asset(
        path,
        fit: BoxFit.fitWidth,
        width: 120,
      ),
    );
  }
}
