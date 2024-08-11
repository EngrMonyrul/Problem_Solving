import 'dart:io';
import 'dart:math';

abstract class Sphare {
  double? radius;
  double? value;
  double piValue = 3.14159;

  void setRadius({required double value});
  void setValue();
}

class SphareImpl extends Sphare {
  @override
  void setRadius({required double value}) {
    radius = value;
  }

  @override
  void setValue() {
    if (radius != null && radius != 0) {
      value = (4 / 3) * piValue * pow(radius!, 3);
    } else {
      throw Exception("Radius can't be null or 0");
    }
  }
}

void main() {
  Sphare sphare = SphareImpl();

  sphare.setRadius(value: double.parse(stdin.readLineSync() ?? ""));
  sphare.setValue();
  if (sphare.value != null && sphare.value != 0) {
    print("VOLUME = ${sphare.value!.toStringAsFixed(3)}");
  }
}
