import 'package:bloc/bloc.dart';


// class GameCubit extends Cubit<List<GameObject>> {
//   GameCubit() : super([]);
//
//   void createObstacle() {
//     emit([...state, Obstacle.randomFactory()]);
//   }
//
//   void moveObstacles() {
//     emit(List.from(
//         state.where((element) => element.xCoordinate >= -1.5)
//       )
//       ..forEach((e) => e.move()));
//   }
//
//   void restart() {
//     emit([]);
//   }
// }
