import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_apps_project/WeatherData.dart';
import 'package:space_apps_project/main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'FunFactObject.dart';
import 'LocationData.dart';
import 'PingData.dart';

class GlobalData {
  List<LocationData> cityList;
  List<PingData> pingList;
  LocationData mainCity;
  WeatherData weatherData;

  List<FunFactObject> funFacts;
  static final GlobalData _singleton = GlobalData._internal();

  factory GlobalData() {
    return _singleton;
  }

  GlobalData._internal();
  void create() {
    pingList = new List();
    funFacts = new List();
    funFacts.add(new FunFactObject("Did you know that public transport reduces polution by 15%?", "https://google.ro"));
    cityList = new List();
    mainCity = new LocationData("Amsterdam", "Netherlands", ["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15], 23, []);
    weatherData = new WeatherData(this.mainCity.weather, this.mainCity.temperature);

    mainCity.pings.add(new PingData(52.3545358, 4.7635337, 23));
    mainCity.pings.add(new PingData(52.3521007, 4.886793, 34));
    mainCity.pings.add(new PingData(52.3478447, 4.7966966,13));
    cityList.add(new LocationData("Amsterdam", "Netherlands", ["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15], 23, []));
    cityList[cityList.length].pings.add(new PingData(52.3545358, 4.7635337, 23));
    cityList[cityList.length].pings.add(new PingData(52.3521007, 4.886793, 34));
    cityList[cityList.length].pings.add(new PingData(52.3478447, 4.7966966,13));
    cityList.add(new LocationData("Shanghai", "China", ["sunny", "cloudy", "cloudy", "cloudy", "rainy"], [20, 23, 23, 20, 23], 127, []));
    cityList[cityList.length].pings.add(new PingData(31.2231277, 120.9148989, 122));
    cityList[cityList.length].pings.add(new PingData(31.1440299, 121.4306818, 154));
    cityList[cityList.length].pings.add(new PingData(31.2684233, 121.5421838,153));
    cityList.add(new LocationData("Beijing", "China", ["sunny", "sunny", "sunny", "cloudy", "cloudy"], [18, 16, 18, 19, 11], 215, []));
    cityList[cityList.length].pings.add(new PingData(39.9385449, 116.1165817, 205));
    cityList[cityList.length].pings.add(new PingData(39.9445038, 116.4851008, 192));
    cityList[cityList.length].pings.add(new PingData(39.8291187, 116.12079, 213));
    cityList.add(new LocationData("Karachi", "Pakistan", ["sunny", "sunny", "sunny", "sunny", "sunny"], [36, 35, 34, 34, 34], 164, []));
    cityList[cityList.length].pings.add(new PingData(25.1921412, 66.5935954, 172));
    cityList.add(new LocationData("Istanbul", "Turkey", ["sunny", "cloudy", "sunny", "rainy", "rainy"], [20, 20, 19, 19, 19], 114, []));
    cityList[cityList.length].pings.add(new PingData(41.1922843, 28.3817107, 87));
    cityList.add(new LocationData("Dhaka", "Bangladesh", ["cloudy", "cloudy", "sunny", "cloudy", "sunny"], [29, 29, 29, 28, 29], 184, []));
    cityList[cityList.length].pings.add(new PingData(23.7805729, 90.2788949, 117));
    cityList.add(new LocationData("Tokyo", "Japan", ["cloudy", "cloudy", "rainy", "cloudy", "cloudy"], [25, 23, 16, 23, 20], 70, []));
    cityList[cityList.length].pings.add(new PingData(35.5040273, 138.6457897, 14));
    cityList[cityList.length].pings.add(new PingData(35.6434372, 139.7400523, 3));
    cityList[cityList.length].pings.add(new PingData(35.6527779, 139.7103776, 10));
    cityList.add(new LocationData("Moscow", "Russia", ["cloudy", "cloudy", "cloudy", "cloudy", "cloudy"], [14, 14, 8, 14, 11], 60, []));
    cityList[cityList.length].pings.add(new PingData(55.5807417, 36.8237404, 5));
    cityList.add(new LocationData("Manila", "Philippines", ["rainy", "rainy", "sunny", "sunny", "sunny"], [31, 30, 30, 30, 29], 55, []));
    cityList[cityList.length].pings.add(new PingData(14.5676285, 120.7397547, 54));
    cityList.add(new LocationData("Tianjin", "China", ["cloudy", "sunny", "cloudy", "cloudy", "cloudy"], [22, 20, 22, 24, 17], 194, []));
    cityList[cityList.length].pings.add(new PingData(39.1246947, 117.0146545, 188));
    cityList.add(new LocationData("Bucharest", "Romania", ["sunny", "sunny", "sunny", "sunny", "sunny"], [24, 22, 23, 21, 21], 74, []));
    cityList[cityList.length].pings.add(new PingData(44.4377397, 25.9542094, 46));
    cityList[cityList.length].pings.add(new PingData(44.4206436, 26.1467312, 52));
    cityList[cityList.length].pings.add(new PingData(44.4542507, 26.0188769, 37));
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  FunFactObject getFunFact() {
    return funFacts[0];
  }

  Icon getWeatherIcon(String weather) {
    switch (weather) {
      case "sunny":
        return Icon(
          Icons.wb_sunny,
          color: Colors.yellow,
        );
        break;
      case "cloudy":
        return Icon(
          Icons.wb_cloudy,
          color: Colors.blue,
        );
        break;
      case "rainy":
        return Icon(
          Icons.grain,
          color: Colors.white,
        );
        break;
      default:
        return Icon(
          Icons.wb_sunny,
          color: Colors.yellow,
        );
        break;
    }
  }

  String getQualityText(int quality) {
    if (quality < 50) {
      return "Good";
    } else if (quality < 100) {
      return "Moderate";
    } else if (quality < 150) {
      return "Bad";
    } else if (quality < 200) {
      return "Unhealthy";
    }
    return "RUN AWAY";
  }

  IconData getQualityIcon(int quality) {
    if (quality < 50) {
      return FontAwesomeIcons.grin;
    } else if (quality < 100) {
      return FontAwesomeIcons.meh;
    } else if (quality < 150) {
      return FontAwesomeIcons.frown;
    } else if (quality < 200) {
      return FontAwesomeIcons.dizzy;
    }
    return FontAwesomeIcons.dizzy;
  }

  Color getCardColor(int quality) {
    if (quality < 50) {
      return Colors.green.shade500;
    } else if (quality < 100) {
      return Colors.orange.shade500;
    } else if (quality < 150) {
      return Colors.red.shade500;
    } else if (quality < 200) {
      return Colors.purple.shade500;
    }
    return Colors.teal.shade500;
  }

  Color getCardDarkColor(int quality) {
    if (quality < 50) {
      return Colors.green.shade700;
    } else if (quality < 100) {
      return Colors.orange.shade700;
    } else if (quality < 150) {
      return Colors.red.shade700;
    } else if (quality < 200) {
      return Colors.purple.shade700;
    }
    return Colors.teal.shade700;
  }
}