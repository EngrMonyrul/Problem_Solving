import 'dart:io';
import 'dart:math';

void main() {
  final Calculation _caluculation = Circle();

  _caluculation.input();
  _caluculation.areaOfCircle();
  _caluculation.display();
}

abstract class Calculation {
  double pi = 3.14159, rad = 0, area = 0;

  void input();

  void areaOfCircle();

  void display();
}

class Circle extends Calculation {
  @override
  void areaOfCircle() {
    area = pi * pow(rad, 2);
  }

  @override
  void display() {
    print("A=${area.toStringAsFixed(4)}");
  }

  @override
  void input() {
    rad = double.parse(stdin.readLineSync() ?? "0");
  }
}
