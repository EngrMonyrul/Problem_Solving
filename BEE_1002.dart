import 'dart:io';
import 'dart:math';

double pi = 3.14159;

class Circle {
  double? radius;
  double? area;

  Circle({this.radius, this.area});
}

abstract class Calculate<T> {
  double shapeCalculate(T shape);
}

class CircleAreaCalculate extends Calculate<Circle> {
  @override
  double shapeCalculate(Circle shape) {
    if (shape.radius != null) {
      return pi * pow(shape.radius ?? 1, 2);
    } else {
      throw Exception("No radius value");
    }
  }
}

class UserInput<T extends num> {
  T getUserInput() {
    final userInputValue = stdin.readLineSync();
    if (userInputValue != null) {
      if (T == double) {
        return double.parse(userInputValue) as T;
      } else if (T == int) {
        return int.parse(userInputValue) as T;
      } else {
        throw Exception("Invalid input type");
      }
    } else {
      throw Exception("Input value can't be null");
    }
  }
}

abstract class Display<T> {
  void display(T value);
}

class CalculateDisplay extends Display<Circle> {
  @override
  void display(Circle value) {
    print("A=${value.area?.toStringAsFixed(4)}");
  }
}

void main() {
  try {
    double userInput = UserInput<double>().getUserInput();
    double circleArea =
        CircleAreaCalculate().shapeCalculate(Circle(radius: userInput));
    CalculateDisplay().display(Circle(area: circleArea));
  } catch (e) {
    throw Exception(e.toString());
  }
}
