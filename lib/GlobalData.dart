import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_apps_project/WeatherData.dart';
import 'package:url_launcher/url_launcher.dart';

import 'FunFactObject.dart';
import 'LocationData.dart';
import 'PingData.dart';
import 'Questss.dart';

class GlobalData {
  List<LocationData> cityList;
  LocationData mainCity;
  List<Questss> quests;
  List<FunFactObject> funFacts;
  static final GlobalData _singleton = GlobalData._internal();
  String done = "You are done for today";

  factory GlobalData() {
    return _singleton;
  }

  GlobalData._internal();
  void create() {
    funFacts = new List();
    funFacts.add(new FunFactObject("Did you know that public transport reduces polution by 15%?", "https://www.thoughtco.com/public-transportation-for-fewer-emissions-1203955"));
    funFacts.add(new FunFactObject("Trees and plants have a varying capacity to capture and/or filter air pollution.. ", "https://www.thoughtco.com/public-transportation-for-fewer-emissions-1203955"));
    funFacts.add(new FunFactObject("Do you know the impact of using renewable energy?", "https://www.ucsusa.org/resources/environmental-impacts-renewable-energy-technologies"));
    funFacts.add(new FunFactObject("Did you know that traffic jams increace carbon emissions?", "https://www.environmentalleader.com/2012/01/how-traffic-jams-affect-air-quality/"));
    cityList = new List();
    quests = new List();
    mainCity = new LocationData("Amsterdam", "Netherlands",new WeatherData(["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15]) , 23, []);
    cityList.add(new LocationData("Amsterdam", "Netherlands", new WeatherData(["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15]), 23, []));
    cityList.add(new LocationData("Shanghai", "China", new WeatherData(["sunny", "cloudy", "cloudy", "cloudy", "rainy"], [20, 23, 23, 20, 23]), 127, []));
    cityList.add(new LocationData("Beijing", "China", new WeatherData(["sunny", "sunny", "sunny", "cloudy", "cloudy"], [18, 16, 18, 19, 11]), 215, []));
    cityList.add(new LocationData("Karachi", "Pakistan", new WeatherData(["sunny", "sunny", "sunny", "sunny", "sunny"], [36, 35, 34, 34, 34]), 164, []));
    cityList.add(new LocationData("Istanbul", "Turkey", new WeatherData(["sunny", "cloudy", "sunny", "rainy", "rainy"], [20, 20, 19, 19, 19]), 114, []));
    cityList.add(new LocationData("Dhaka", "Bangladesh", new WeatherData(["cloudy", "cloudy", "sunny", "cloudy", "sunny"], [29, 29, 29, 28, 29]), 184, []));
    cityList.add(new LocationData("Tokyo", "Japan", new WeatherData(["cloudy", "cloudy", "rainy", "cloudy", "cloudy"], [25, 23, 16, 23, 20]), 70, []));
    cityList.add(new LocationData("Moscow", "Russia", new WeatherData(["cloudy", "cloudy", "cloudy", "cloudy", "cloudy"], [14, 14, 8, 14, 11]), 60, []));
    cityList.add(new LocationData("Manila", "Philippines", new WeatherData(["rainy", "rainy", "sunny", "sunny", "sunny"], [31, 30, 30, 30, 29]), 55, []));
    cityList.add(new LocationData("Tianjin", "China", new WeatherData(["cloudy", "sunny", "cloudy", "cloudy", "cloudy"], [22, 20, 22, 24, 17]), 194, []));
    cityList.add(new LocationData("Bucharest", "Romania", new WeatherData(["sunny", "sunny", "sunny", "sunny", "sunny"], [24, 22, 23, 21, 21]), 74, []));

    mainCity.pings.add(new PingData(52.3545358, 4.7635337, 23));
    mainCity.pings.add(new PingData(52.3521007, 4.886793, 34));
    mainCity.pings.add(new PingData(52.3478447, 4.7966966,13));

    quests.add(new Questss("Don't use the car today.", 0));
    quests.add(new Questss("Plant a tree.", 1));
    quests.add(new Questss("Save electricity", 2));
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
          FontAwesomeIcons.cloudRain,
          color: Colors.grey,
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