import 'package:among_us_jump/blocs/character/character_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyCharacter extends StatelessWidget {
  const MyCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment(-1.0, state.yCoordinate),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Image.asset(
                      state.path,
                      width: 60,
                      height: 78,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
            ),
            Expanded(
                child: Container()
            )
          ],
        );
      },
    );
  }
}
