import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class RestartDialog extends StatelessWidget {
  final void Function() onPressed;

  const RestartDialog({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        //Dialog Main Title
        title: Column(
          children: const <Widget>[
            Text("You Died"),
          ],
        ),
        //
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Restart?",
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.popRoute(this);
              },
              child: const Text('홈으로')
          ),
          IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.restart_alt)
          )
        ],
      ),
    );
  }
}
