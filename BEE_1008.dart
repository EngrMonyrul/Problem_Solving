import 'dart:io';

void main() {
  //User Input
  final employeeNumber = int.parse(stdin.readLineSync() ?? "0");
  final workHour = int.parse(stdin.readLineSync() ?? "0");
  final hourlyPay = double.parse(stdin.readLineSync() ?? "0");

  //calcualtion
  final totalPaid = workHour * hourlyPay;

  //display
  print(
      "NUMBER = $employeeNumber\nSALARY = U\$ ${totalPaid.toStringAsFixed(2)}");
}
