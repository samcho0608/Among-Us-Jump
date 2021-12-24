import 'package:among_us_jump/constants.dart';
import 'package:among_us_jump/routes/app_router.gr.dart';
import 'package:among_us_jump/screens/home/widgets/page_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
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
                const Text(
                  'Among Us Jump',
                  style: TextStyle(
                      fontFamily: 'Among Us Logo Font',
                      color: Colors.white,
                      fontSize: 80,
                      shadows: [
                        Shadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ]
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: const PageButton(buttonText: '설정'),
                    ),
                    GestureDetector(
                      onTap: () => context.pushRoute(const GameRoute()),
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
