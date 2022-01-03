import 'package:among_us_jump/blocs/character/character_cubit.dart';
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

Sprite character = Sprite(
    imagePath: 'assets/images/among_us_characters/among_us_character_blue.png',
    imageWidth: 70,
    imageHeight: 90
);

class Character extends GameObject {
  const Character({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      character.imagePath,
      gaplessPlayback: true,
    );
  }

  @override
  Rect getRect(Size screenSize) {
    return Rect.fromLTWH(
        screenSize.width / 10,
        screenSize.height * 3 / 4 - character.imageHeight,
        character.imageWidth.toDouble(),
        character.imageHeight.toDouble()
    );
  }

  @override
  void update(Duration lastTime, Duration elapsedTime) {
    // TODO: implement update
    super.update(lastTime, elapsedTime);
  }
}