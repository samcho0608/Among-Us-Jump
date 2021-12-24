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
            color: const Color.fromRGBO(16, 18, 27, 1.0),
          ),
        ),
        Expanded(
            child: Container(
              color: Colors.deepPurple,
            )
        )
      ],
    );
  }
}
