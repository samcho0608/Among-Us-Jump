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

    emit([...state]
      ..where((element) => element.xCoordinate < -1.0)
      ..forEach((e) => e.move()));
  }
}
