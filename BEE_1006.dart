import 'dart:io';

extension StringExt on String {
  double get getDouble => double.parse(this);

  int get getInt => int.parse(this);
}

abstract class UserInput<T extends num> {
  T getUserInput();
}

class UserInputImpl<T extends num> extends UserInput<T> {
  @override
  T getUserInput() {
    final input = stdin.readLineSync();

    if (input != null && input != "") {
      if (T == double) {
        return input.getDouble as T;
      } else if (T == int) {
        return input.getInt as T;
      } else {
        throw Exception("Type error");
      }
    } else {
      throw Exception("Invalid input");
    }
  }
}

abstract class Calculation<T extends num> {
  T calculate(List<T> values);
}

class CalculationImpl<T extends num> extends Calculation<T> {
  final List<int> weightValue = [2, 3, 5];

  @override
  T calculate(List<T> values) {
    if (values.isEmpty) throw Exception("Invalid list");

    double totalValue = 0;
    double totalWeightValue = 0;

    for (int i = 0; i < values.length; i++) {
      totalWeightValue += weightValue[i];
      totalValue += (values[i] * weightValue[i]);
    }
    final average = totalValue / totalWeightValue;

    if (T == double) {
      return average as T;
    } else if (T == int) {
      return average as T;
    } else {
      throw Exception("Type error");
    }
  }
}

abstract class Display<T extends num> {
  void displayValue({required T value, required String message});
}

class DisplayImpl<T extends num> extends Display<T> {
  @override
  void displayValue({required T value, required String message}) {
    print(message + value.toStringAsFixed(1));
  }
}

void main() {
  List<double> inputs = [];
  while (inputs.length < 3) {
    inputs.add(UserInputImpl<double>().getUserInput());
  }

  final calculateInputs = CalculationImpl<double>().calculate(inputs);

  DisplayImpl<double>()
      .displayValue(value: calculateInputs, message: "MEDIA = ");
}
