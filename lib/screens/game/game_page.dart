import 'dart:async';

import 'package:among_us_jump/blocs/character/character_cubit.dart';
import 'package:among_us_jump/blocs/game/game_cubit.dart';

import 'widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';


class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with WidgetsBindingObserver {
  MyCharacter character = const MyCharacter();
  double time = 0.0;
  final ObstaclesCubit _obstacleCubit = ObstaclesCubit();
  final _audioPlayer = AudioPlayer();
  double obstacleCreateInterval = 1.5;
  late Timer _gameTimer;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _audioPlayer.stop();
      _gameTimer.cancel();
    }
    else if (state == AppLifecycleState.resumed) {
      _audioPlayer.play();
      runGame(context.read<GameCubit>().state.duration);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    setUpBGM();
    runGame(context.read<GameCubit>().state.duration);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _gameTimer.cancel();
    super.dispose();
  }

  Future<void> setUpBGM() async {
    await _audioPlayer.setAsset('assets/audio/bgm.mp3');
    await _audioPlayer.setLoopMode(LoopMode.one);
    _audioPlayer.play();
  }

  void runGame(Duration duration) {
    _gameTimer = Timer.periodic(duration, (timer) {
      setState(() {
        time += 0.015;
        obstacleCreateInterval -= 0.015;
        if(obstacleCreateInterval <= 0) {
          _obstacleCubit.createObstacle();
          obstacleCreateInterval = 1.5;
        }
        _obstacleCubit.moveObstacles();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTapUp: (_) => context.read<CharacterCubit>().shortJump(),
          onLongPressUp: () => context.read<CharacterCubit>().longJump(),
          child: BlocProvider.value(
            value: _obstacleCubit,
            child: BlocBuilder<ObstaclesCubit, List<Obstacle>>(
              builder: (context, state) {
                return Stack(
                  children: [
                    const Background(),
                    TimerWidget(time: time),
                    character,
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
