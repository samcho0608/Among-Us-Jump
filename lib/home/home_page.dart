import 'dart:async';

import 'package:among_us_jump/home/widgets/background.dart';
import 'package:among_us_jump/home/character/character_cubit.dart';
import 'package:among_us_jump/home/character/my_character.dart';
import 'package:among_us_jump/home/obstacles/obstacle_widget.dart';
import 'package:among_us_jump/home/obstacles/obstacles_cubit.dart';
import 'package:among_us_jump/home/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'obstacles/obstacle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  Duration duration = const Duration(milliseconds: 5);
  MyCharacter character = const MyCharacter();
  late final CharacterCubit _characterCubit = CharacterCubit(
      duration: duration);
  double time = 0.0;
  final ObstaclesCubit _obstacleCubit = ObstaclesCubit();
  final _audioPlayer = AudioPlayer();

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _audioPlayer.stop();
    }
    else if (state == AppLifecycleState.resumed) {
      _audioPlayer.play();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    setUpBGM();
    runGame();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> setUpBGM() async {
    await _audioPlayer.setAsset('assets/audio/bgm.mp3');
    await _audioPlayer.setLoopMode(LoopMode.one);
    _audioPlayer.play();
  }

  void runGame() {
    Timer.periodic(const Duration(seconds: 1, milliseconds: 500), (timer) {
      setState(() {
        _obstacleCubit.createObstacle();
      });
    });

    Timer.periodic(duration, (timer) {
      setState(() {
        time += 0.005;
        _obstacleCubit.moveObstacles();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTapUp: (_) => _characterCubit.shortJump(),
          onLongPressUp: () => _characterCubit.longJump(),
          child: BlocProvider.value(
            value: _obstacleCubit,
            child: BlocBuilder<ObstaclesCubit, List<Obstacle>>(
              builder: (context, state) {
                return Stack(
                  children: [
                    const Background(),
                    TimerWidget(time: time),
                    BlocProvider.value(
                      value: _characterCubit,
                      child: character,
                    ),
                    for(var obs in context
                        .read<ObstaclesCubit>()
                        .state)
                      ObstacleWidget(obstacle: obs),
                  ],
                );
              },
            ),
          ),
        )
    );
  }
}
