import 'dart:io';
import 'string_ext.dart';

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
