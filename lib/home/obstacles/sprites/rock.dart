import 'package:flutter/material.dart';

class Rock extends StatelessWidget {
  const Rock({Key? key}) : super(key: key);
  final path = 'assets/images/among_us_rock.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 80,
        child: Image.asset(path)
    );
  }
}
