import 'dart:io';

abstract class UserInput<T extends num> {
  T getInput();
}

abstract class Calculate<T extends num> {
  T product(List<T> values);
}

abstract class Display<T extends num> {
  void display(T value);
}

extension StringX on String {
  double get getDouble => double.parse(this);

  int get getInt => int.parse(this);
}

class GetUserInput<T extends num> extends UserInput<T> {
  @override
  T getInput() {
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
      throw Exception("Invalid inputs");
    }
  }
}

class CalculateInput<T extends num> extends Calculate<T> {
  @override
  T product(List<T> values) {
    if (values.isEmpty) throw Exception("Empty values");

    double prod = 1;

    values.forEach((value) {
      prod *= value.toDouble();
    });

    if (T == int) {
      return prod.toInt() as T;
    } else if (T == double) {
      return prod.toDouble() as T;
    } else {
      throw Exception("Type error");
    }
  }
}

class DisplayValue<T extends num> extends Display<T> {
  @override
  void display(T value) {
    print("PROD = $value");
  }
}

void main() {
  try {
    final a = GetUserInput<int>().getInput();
    final b = GetUserInput<int>().getInput();
    final PROD = CalculateInput<int>().product(<int>[a, b]);
    DisplayValue<int>().display(PROD);
  } catch (e) {
    throw Exception(e.toString());
  }
}
