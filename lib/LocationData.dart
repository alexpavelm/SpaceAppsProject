import 'dart:core';

import 'PingData.dart';

class LocationData {

  String city;
  String country;
  String weather;
  int temperature;
  int quality;
  List<PingData> pings;


  LocationData(this.city, this.country, this.weather, this.temperature, this.quality, this.pings);



}