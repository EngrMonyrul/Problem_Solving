import 'dart:io';

class Product {
  int? code;
  int? unit;
  double? price;

  Product({this.code, this.unit, this.price});
}

class Calculation {
  var product1 = Product();
  var product2 = Product();
  double? totalPrice;

  void setProducts() {
    for (int i = 0; i < 2; i++) {
      var product = Product(
        code: int.parse(stdin.readLineSync() ?? "0"),
        unit: int.parse(stdin.readLineSync() ?? "0"),
        price: double.parse(stdin.readLineSync() ?? "0"),
      );

      if (i == 0) {
        product1 = product;
      } else {
        product2 = product;
      }
    }
  }

  void calculation() {
    if (product1.unit == null || product2.unit == null) setProducts();

    final product1Price = (product1.unit ?? 0) * (product1.price ?? 0);
    final product2Price = (product2.unit ?? 0) * (product2.price ?? 0);

    totalPrice = product1Price + product2Price as double;
  }

  void display() {
    if (totalPrice == null) calculation();
    print("VALOR A PAGAR: R\$ ${totalPrice?.toStringAsFixed(2)}");
  }
}

void main() {
  final calculation = Calculation();
  calculation.setProducts(); // Set products before calculating/displaying
  calculation.display();
}
