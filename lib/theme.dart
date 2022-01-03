import 'package:flutter/material.dart';

const TitleTextStyle = TextStyle(
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
);

const ButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18
);

const TimerTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 25.0
);

final appTheme = ThemeData(
    fontFamily: 'VCR OSD Mono',
    textTheme: const TextTheme(
        headline1: TitleTextStyle,
        bodyText1: ButtonTextStyle,
        bodyText2: TimerTextStyle
    )
);