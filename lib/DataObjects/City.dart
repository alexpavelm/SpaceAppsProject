import 'dart:core';

import 'Ping.dart';
import 'WeatherData.dart';

class City {

  String name;
  String country;
  WeatherData weatherData;
  int quality;
  List<Ping> pings;

  City(this.name, this.country, this.weatherData, this.quality, this.pings);

}