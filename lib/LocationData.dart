import 'dart:core';

import 'PingData.dart';

class LocationData {

  String city;
  String coutry;
  String weather;
  int temperature;
  int quality;
  List<PingData> pings;


  LocationData(this.city, this.coutry, this.weather, this.temperature, this.quality, this.pings);



}