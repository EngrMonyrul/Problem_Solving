enum Operations {
  addition,
  substraction,
  multiplication,
  division;

  bool get isAddition => this == addition;

  bool get isSubstraction => this == substraction;

  bool get isMultiplication => this == multiplication;

  bool get isDivision => this == division;

  static List<Operations> get list => values;

  String? get text => switch (this) {
        addition => "Addition",
        substraction => "Substraction",
        multiplication => "Multiplication",
        division => "Division",
        _ => null,
      };
}

abstract class Calculation<T extends num> {
  T calculate(List<T> values);
}

class CalculationImpl<T extends num> extends Calculation<T> {
  @override
  T calculate(List<T> values) {
    // TODO: implement calculate
    throw UnimplementedError();
  }
}
