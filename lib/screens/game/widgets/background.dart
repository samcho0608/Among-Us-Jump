import 'package:among_us_jump/constants.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: darkBackgroundColor,
          ),
        ),
        Expanded(
            child: Container(
              color: purpleBackgroundColor,
            )
        )
      ],
    );
  }
}
