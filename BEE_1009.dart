import 'dart:io';

void main() {
  //user input
  final name = stdin.readLineSync();
  final fixedSalary = double.parse(stdin.readLineSync() ?? "0");
  final totalSold = double.parse(stdin.readLineSync() ?? "0");

  //calculation
  final commision = (totalSold / 100) * 15;
  final totalSalary = fixedSalary + commision;

  //display
  print("TOTAL = R\$ ${totalSalary.toStringAsFixed(2)}");
}
