import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_apps_project/main.dart';

import 'LocationData.dart';

class GlobalData {
  List<LocationData> cityList;
  LocationData mainCity;

  static final GlobalData _singleton = GlobalData._internal();

  factory GlobalData() {
    return _singleton;
  }

  GlobalData._internal();
  void create() {
    cityList = new List();
    mainCity = new LocationData("Amsterdam", "Netherlands", ["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15], 23, []);
    cityList.add(new LocationData("Amsterdam", "Netherlands", ["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15], 23, []));
    cityList.add(new LocationData("Shanghai", "China", ["sunny", "cloudy", "cloudy", "cloudy", "rainy"], [20, 23, 23, 20, 23], 127, []));
    cityList.add(new LocationData("Beijing", "China", ["sunny", "sunny", "sunny", "cloudy", "cloudy"], [18, 16, 18, 19, 11], 215, []));
    cityList.add(new LocationData("Karachi", "Pakistan", ["sunny", "sunny", "sunny", "sunny", "sunny"], [36, 35, 34, 34, 34], 164, []));
    cityList.add(new LocationData("Istanbul", "Turkey", ["sunny", "cloudy", "sunny", "rainy", "rainy"], [20, 20, 19, 19, 19], 114, []));
    cityList.add(new LocationData("Dhaka", "Bangladesh", ["cloudy", "cloudy", "sunny", "cloudy", "sunny"], [29, 29, 29, 28, 29], 184, []));
    cityList.add(new LocationData("Tokyo", "Japan", ["cloudy", "cloudy", "rainy", "cloudy", "cloudy"], [25, 23, 16, 23, 20], 70, []));
    cityList.add(new LocationData("Moscow", "Russia", ["cloudy", "cloudy", "cloudy", "cloudy", "cloudy"], [14, 14, 8, 14, 11], 60, []));
    cityList.add(new LocationData("Manila", "Philippines", ["rainy", "rainy", "sunny", "sunny", "sunny"], [31, 30, 30, 30, 29], 55, []));
    cityList.add(new LocationData("Tianjin", "China", ["cloudy", "sunny", "cloudy", "cloudy", "cloudy"], [22, 20, 22, 24, 17], 194, []));
    cityList.add(new LocationData("Bucharest", "Romania", ["sunny", "sunny", "sunny", "sunny", "sunny"], [24, 22, 23, 21, 21], 74, []));
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