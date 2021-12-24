import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final double time;

  const TimerWidget({required this.time, Key? key}) : super(key: key);

  String formatTime(double time) {
    int flooredTime = time.floor();
    String seconds = '${flooredTime % 60}'.padLeft(2, '0');
    String minutes = '${flooredTime ~/ 60}';
    return '$minutes : $seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.9, -0.9),
      child: Text(
        formatTime(time),
        style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0
        ),
      ),
    );
  }
}
