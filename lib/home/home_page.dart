import 'dart:async';

import 'package:among_us_jump/home/character/character_cubit.dart';
import 'package:among_us_jump/home/character/my_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void runGame() {
    Timer.periodic(duration, (timer) {
      time += 0.005;
      // print(time);
      setState(() {
        time += 0.005;
      });
    });
  }

  String formatTime(double time) {
    int seconds = time.floor() % 60;
    int minutes = (time - seconds / 60).floor();
    return '$minutes : $seconds';
  }

  @override
  Widget build(BuildContext context) {
    runGame();
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            _characterCubit.jump();
          },
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: AnimatedContainer(
                    duration: duration,
                    color: const Color.fromRGBO(16, 18, 27, 1.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.0,-0.9),
                          child: Text(
                            formatTime(time),
                            style: TextStyle(
                              color: Colors.white
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
