import 'package:among_us_jump/blocs/character/character_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final List<String> characterSprites = [
    for(var color in [
      'blue', 'brown', 'crimson', 'cyan', 'green',
      'grey', 'light_blue', 'light_green', 'orange',
      'pink', 'purple', 'red', 'white', 'yellow'
    ])
    'assets/images/among_us_characters/among_us_character_$color.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children : [
          Center(
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      colors: [
                        Colors.blueGrey,
                        Colors.black
                      ]
                  ),
                  shape: BoxShape.circle
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0, -0.8),
            child: Text(
              '원하는 색의 캐릭터를 선택해보세요!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
          ),
          CarouselSlider(
              items: List.from(
                  characterSprites.map((path) =>
                      GestureDetector(
                        onTap: () {
                          context.read<CharacterCubit>().changeColor(path);
                          context.popRoute(this);
                        },
                        child: Image.asset(
                          path,
                          width: 60,
                        ),
                      )
                  )
              ),
              options: CarouselOptions(
                height: 400,
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (pageIndex, reason) {},
                scrollDirection: Axis.horizontal,
              )
          ),
          Align(
            alignment: const Alignment(-0.9,-0.8),
            child: IconButton(
                onPressed: () {
                  context.popRoute(this);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )
            ),
          ),
        ],
      ),
    );
  }
}
