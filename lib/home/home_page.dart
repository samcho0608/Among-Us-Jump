import 'dart:async';

import 'package:among_us_jump/home/character/character_cubit.dart';
import 'package:among_us_jump/home/character/my_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration duration = const Duration(milliseconds: 5);
  MyCharacter character = const MyCharacter();
  late final CharacterCubit _characterCubit = CharacterCubit(duration: duration);
  double time = 0.0;

  @override
  void initState() {
    super.initState();
    runGame();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void runGame() {
    Timer.periodic(duration, (timer) {
      setState(() {
        time += 0.005;
      });
    });
  }

  String formatTime(double time) {
    int flooredTime = time.floor();
    String seconds = '${flooredTime % 60}'.padLeft(2,'0');
    String minutes = '${flooredTime ~/ 60}';
    return '$minutes : $seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            _characterCubit.jump();
          },
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    color: const Color.fromRGBO(16, 18, 27, 1.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const Alignment(0.0,-0.9),
                          child: Text(
                            formatTime(time),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25.0
                            ),
                          ),
                        ),
                        BlocProvider.value(
                            value: _characterCubit,
                            child: character
                        )
                      ],
                    )
                ),
              ),
              Expanded(
                  child: Container(
                    color: Colors.deepPurple,
                  )
              )
            ],
          ),
      )
    );
  }
}
