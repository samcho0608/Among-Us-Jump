import 'package:among_us_jump/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FutureBuilder(
          future: SharedPreferences.getInstance(),
            builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
              SharedPreferences? prefs = snapshot.data;
              int? originalHighMin = prefs?.getInt(highMin);
              int? originalHighSec = prefs?.getInt(highSec);

              if(originalHighSec != null && originalHighMin != null){
                return Text(
                  'HI: $originalHighMin : ${'$originalHighSec'.padLeft(2,'0')}',
                  style: Theme.of(context).textTheme.bodyText2,
                );
              } else {
                return Container();
              }
            }
        ),
        const SizedBox(width: 10,),
        Text(
          'TIME: ${formatTime(time)}',
          style: Theme.of(context).textTheme.bodyText2
        ),
      ],
    );
  }
}
