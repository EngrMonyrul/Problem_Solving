import 'dart:io';

abstract class UserInput<T extends num> {
  T getUserInput();
}

extension StringX on String {
  double get getDouble => double.parse(this);

  int get getInt => int.parse(this);
}

abstract class Display<T extends num> {
  void display(T value);
}

abstract class Calculate<T extends num> {
  T calculateSum(List<T> values);
}

class InputIntValue<T extends num> extends UserInput<T> {
  @override
  T getUserInput() {
    final userInput = stdin.readLineSync();
    if (userInput != null) {
      if (T == int) {
        return userInput.getInt as T;
      } else if (T == double) {
        return userInput.getDouble as T;
      } else {
        throw Exception("Invalid type");
      }
    } else {
      throw Exception("Invalid user input");
    }
  }
}

class Sum<T extends num> extends Calculate<T> {
  @override
  T calculateSum(List<T> values) {
    if (values.isEmpty) throw Exception("Invalid num list");

    double sum = 0;

    for (var value in values) {
      sum += value.toDouble();
    }

    if (T == int) {
      return sum.toInt() as T;
    } else if (T == double) {
      return sum.toDouble() as T;
    } else {
      throw Exception("Invalid type");
    }
  }
}

class DisplaySum<T extends num> extends Display<T> {
  @override
  void display(T value) {
    print("SOMA = $value");
  }
}

void main() {
  final A = InputIntValue<int>().getUserInput();
  final B = InputIntValue<int>().getUserInput();
  final SOMA = Sum<int>().calculateSum(<int>[A, B]);
  DisplaySum<int>().display(SOMA);
}
