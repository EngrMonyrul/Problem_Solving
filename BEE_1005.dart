import 'dart:io';

void main() {
  //User Input
  final a = double.parse(stdin.readLineSync() ?? "0");
  final b = double.parse(stdin.readLineSync() ?? "0");

  //Calculation
  final result = ((a * 3.5) + (b * 7.5)) / (3.5 + 7.5);

  //Display
  print("MEDIA = ${result.toStringAsFixed(5)}");
}
