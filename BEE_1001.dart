import 'dart:io';

void main() {
  Calculation _sum = Sum();

  _sum.input();
  _sum.sum();
  _sum.display();
}

abstract class Calculation {
  int A = 0, B = 0, X = 0;

  void input();

  void sum();

  void display();
}

class Sum extends Calculation {
  @override
  void display() {
    print("X = $X");
  }

  @override
  void input() {
    A = int.parse(stdin.readLineSync() ?? "0");
    B = int.parse(stdin.readLineSync() ?? "0");
  }

  @override
  void sum() {
    X = A + B;
  }
}
