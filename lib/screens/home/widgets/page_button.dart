import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  final String buttonText;

  const PageButton({required this.buttonText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: Colors.white,
              width: 3.0
          ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(5.0, 5.0),
            blurRadius: 3.0,
            color: Color.fromARGB(255, 0, 0, 0),
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25
            ),
          ),
        ),
      ),
    );
  }
}
