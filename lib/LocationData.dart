import 'dart:core';

import 'PingData.dart';
import 'WeatherData.dart';

class LocationData {

  String city;
  String country;
  WeatherData weatherData;
  int quality;
  List<PingData> pings;

  LocationData(this.city, this.country, this.weatherData, this.quality, this.pings);

}