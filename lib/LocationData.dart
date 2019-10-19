import 'dart:core';

class LocationData {

  double density;
  double carsPerThousand;
  double area;

  LocationData(this.density, this.carsPerThousand, this.area);

  double GetCO2Emission() {

    double co2Emission;

    co2Emission = (density*carsPerThousand)/1000;
    co2Emission *= area;

    return co2Emission;
  }

}