import 'dart:io';

void main() {
  //User Input
  final a = int.parse(stdin.readLineSync() ?? "0");
  final b = int.parse(stdin.readLineSync() ?? "0");
  final c = int.parse(stdin.readLineSync() ?? "0");
  final d = int.parse(stdin.readLineSync() ?? "0");

//Calculation
  final calculate = ((a * b) - (c * d));

//Display
  print("DIFERENCA = $calculate");
}
