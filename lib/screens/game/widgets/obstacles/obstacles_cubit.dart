import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'obstacle.dart';

part 'obstacles_state.dart';

class ObstaclesCubit extends Cubit<List<Obstacle>> {
  ObstaclesCubit() : super([]);

  void createObstacle() {
    emit([...state, Obstacle()]);
  }

  void moveObstacles() {
    emit(List.from(
        state.where((element) => element.xCoordinate >= -1.5)
      )
      ..forEach((e) => e.move()));
  }

  void restart() {
    emit([]);
  }
}
