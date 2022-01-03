import 'package:among_us_jump/routes/app_router.gr.dart';
import 'package:among_us_jump/screens/home/widgets/page_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatelessWidget with WidgetsBindingObserver{
  final AudioPlayer _audioPlayer = AudioPlayer();

  HomePage({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    setUpBGM();
    WidgetsBinding.instance?.addObserver(this);
  }

  Future<void> setUpBGM() async {
    await _audioPlayer.setAsset('assets/audio/home_bgm.mp3');
    await _audioPlayer.setLoopMode(LoopMode.one);
    _audioPlayer.play();
  }

  @override
  Future<bool> didPopRoute() {
    // TODO:: make sure this isn't called when back button pressed from settings page
    _audioPlayer.seek(const Duration(seconds: 0))
        .then((value) => _audioPlayer.play());
    return super.didPopRoute();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _audioPlayer.stop();
    }
    else if (state == AppLifecycleState.resumed) {
      _audioPlayer.seek(const Duration(seconds: 0))
          .then((value) => _audioPlayer.play());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/christmas_background.jpeg',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Among Us Jump',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context.pushRoute(SettingsRoute()),
                      child: const PageButton(buttonText: '캐릭터 설정'),
                    ),
                    GestureDetector(
                      onTap: () {
                        _audioPlayer.stop();
                        context.pushRoute(const GameRoute());
                      },
                      child: const PageButton(buttonText: 'Game Start',),
                    ),
                    GestureDetector(
                      child: const PageButton(buttonText: '메리 크리스마스'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
