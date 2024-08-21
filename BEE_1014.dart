import 'dart:io';

abstract class TravelCost {
  double? fuelInLiters;
  int? distanceInKilometers;

  void setFuelInLiters({double? liters});
  void setDistanceInKM({int? km});
  double getTotalTravelDistancePerLiters();
}

class CalculateTravelDistancePerLiters extends TravelCost {
  @override
  double getTotalTravelDistancePerLiters() {
    if (distanceInKilometers != null && fuelInLiters != null) {
      return (distanceInKilometers! / fuelInLiters!);
    } else {
      throw Exception("Distance and Fuel won't be null");
    }
  }

  @override
  void setDistanceInKM({int? km}) {
    distanceInKilometers = km;
  }

  @override
  void setFuelInLiters({double? liters}) {
    fuelInLiters = liters;
  }
}

void main() {
  TravelCost travelCost = CalculateTravelDistancePerLiters();

  final km = int.parse(stdin.readLineSync()!);
  final fuel = double.parse(stdin.readLineSync()!);

  travelCost.setDistanceInKM(km: km);
  travelCost.setFuelInLiters(liters: fuel);

  final totalCost = travelCost.getTotalTravelDistancePerLiters();

  print(totalCost.toStringAsFixed(3) + " km/l");
}
