import 'dart:io';

extension StringX on String {
  double get getDouble => double.parse(this);

  int get getInt => int.parse(this);
}

abstract class UserInput<T extends num> {
  T input();
}

abstract class Calculation<T extends num> {
  T calculate(List<T> values);
}

abstract class Display<T> {
  void display(T values);
}

class Input<T extends num> extends UserInput<T> {
  @override
  T input() {
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

class Calculate<T extends num> extends Calculation<T> {
  @override
  T calculate(List<T> values) {
    if (values.isEmpty) throw Exception("Invalid values");
    double average = 0;
    values.forEach((value) {
      average += value.toDouble();
    });
    average /= values.length;

    if (T == int) {
      return average.toInt() as T;
    } else if (T == double) {
      return average.toDouble() as T;
    } else {
      throw Exception("Invalid type");
    }
  }
}

class PrintValues<T extends num> extends Display<T> {
  @override
  void display(T values) {
    print("MEDIA = ${values.toStringAsFixed(5)}");
  }
}

void main() {
  try {
    final a = Input<double>().input();
    final b = Input<double>().input();

    final average = Calculate<double>().calculate(<double>[a, b]);

    PrintValues<double>().display(average);
  } catch (e) {
    throw Exception(e.toString());
  }
}
