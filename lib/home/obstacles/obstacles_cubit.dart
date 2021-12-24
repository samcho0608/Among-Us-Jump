import 'package:among_us_jump/home/obstacles/obstacle.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'obstacles_state.dart';

class ObstaclesCubit extends Cubit<List<Obstacle>> {
  ObstaclesCubit() : super([]);

  void createObstacle() {
    emit([...state, Obstacle()]);
  }

  void moveObstacles() {
    emit([...state]..forEach((e) => e.move()));
  }
}
