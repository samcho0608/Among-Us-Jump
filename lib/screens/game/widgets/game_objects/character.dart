import 'package:among_us_jump/blocs/character/character_cubit.dart';
import 'package:among_us_jump/constants.dart';
import 'package:among_us_jump/screens/game/widgets/game_objects/game_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// class MyCharacter extends StatelessWidget {
//   const MyCharacter({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CharacterCubit, CharacterState>(
//       builder: (context, state) {
//         return Align(
//           alignment: Alignment(-0.8, state.yCoordinate),
//           child: Image.asset(
//             state.path,
//             width: 60,
//             height: 78,
//             fit: BoxFit.fitWidth,
//           ),
//         );
//       },
//     );
//   }
// }

class Character extends GameObject {

  const Character({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      context.read<CharacterCubit>().state.path,
      gaplessPlayback: true,
    );
  }

  @override
  Rect getRect(BuildContext context, Size screenSize) {
    CharacterState state = context.read<CharacterCubit>().state;
    Sprite sprite = Sprite(
        imagePath: state.path,
        imageWidth: CHARACTER_WIDTH,
        imageHeight: CHARACTER_HEIGHT
    );

    return Rect.fromLTWH(
        screenSize.width / 10,
        screenSize.height * 3 / 4 - sprite.imageHeight - state.dispY,
        sprite.imageWidth.toDouble(),
        sprite.imageHeight.toDouble()
    );
  }
}