import 'dart:math';

class Obstacle {
  final type = Random().nextInt(4);
  double xCoordinate = 1.1;

  void move() {
    xCoordinate -= 0.015;
  }
}