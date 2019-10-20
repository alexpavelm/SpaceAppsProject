import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  Future cityAssiged;

  static final GlobalData _singleton = GlobalData._internal();
  BitmapDescriptor greenMarker, yellowMarker, orangeMarker, redMarker, purpleMarker;

  factory GlobalData() {
    return _singleton;
  }

  GlobalData._internal();
  void create() {
    _createMarkerImageFromAsset();
    funFacts = new List();
    cityList = new List();
    quests = new List();
    //mainCity = new LocationData("Amsterdam", "Netherlands",new WeatherData(["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15]) , 23, []);
    funFacts.add(new FunFactObject("Did you know that public transport reduces polution by 15%?", "https://www.thoughtco.com/public-transportation-for-fewer-emissions-1203955"));
    funFacts.add(new FunFactObject("Trees and plants have a varying capacity to capture and/or filter air pollution.. ", "https://www.thoughtco.com/public-transportation-for-fewer-emissions-1203955"));
    funFacts.add(new FunFactObject("Do you know the impact of using renewable energy?", "https://www.ucsusa.org/resources/environmental-impacts-renewable-energy-technologies"));
    funFacts.add(new FunFactObject("Did you know that traffic jams increace carbon emissions?", "https://www.environmentalleader.com/2012/01/how-traffic-jams-affect-air-quality/"));

    cityList.add(new LocationData("Amsterdam", "Netherlands", new WeatherData(["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15]), 23, []));
    cityList.add(new LocationData("Shanghai", "China", new WeatherData(["sunny", "cloudy", "cloudy", "cloudy", "rainy"], [20, 23, 23, 20, 23]), 127, []));
    cityList.add(new LocationData("Beijing", "China", new WeatherData(["sunny", "sunny", "sunny", "cloudy", "cloudy"], [18, 16, 18, 19, 11]), 215, []));
    cityList.add(new LocationData("Paris", "France", new WeatherData(["rainy", "rainy", "cloudy", "sunny", "sunny"], [13, 14, 14, 20, 20]), 53, []));
    cityList.add(new LocationData("Istanbul", "Turkey", new WeatherData(["sunny", "cloudy", "sunny", "rainy", "rainy"], [20, 20, 19, 19, 19]), 114, []));
    cityList.add(new LocationData("London", "England", new WeatherData(["sunny", "rainy", "sunny", "sunny", "rainy"], [13, 14, 14, 15, 17]), 62, []));
    cityList.add(new LocationData("Tokyo", "Japan", new WeatherData(["cloudy", "cloudy", "rainy", "cloudy", "cloudy"], [25, 23, 16, 23, 20]), 70, []));
    cityList.add(new LocationData("Moscow", "Russia", new WeatherData(["cloudy", "cloudy", "cloudy", "cloudy", "cloudy"], [14, 14, 8, 14, 11]), 60, []));
    cityList.add(new LocationData("New York", "USA", new WeatherData(["rainy", "cloudy", "rainy", "sunny", "sunny"], [18, 21, 18, 17, 18]), 60, []));
    cityList.add(new LocationData("Berlin", "Germany", new WeatherData(["sunny", "sunny", "sunny", "sunny", "sunny"], [20, 21, 17, 17, 19]), 20, []));
    cityList.add(new LocationData("Bucharest", "Romania", new WeatherData(["sunny", "sunny", "sunny", "sunny", "sunny"], [24, 22, 23, 21, 21]), 74, []));

    /*mainCity.pings.add(new PingData(52.3545358, 4.7635337, 23));
    mainCity.pings.add(new PingData(52.3521007, 4.886793, 34));
    mainCity.pings.add(new PingData(52.3478447, 4.7966966,13));*/
    cityList[0].pings.add(new PingData(52.3545358, 4.7635337, 23));
    cityList[0].pings.add(new PingData(52.3521007, 4.886793, 34));
    cityList[0].pings.add(new PingData(52.3478447, 4.7966966,13));
    cityList[1].pings.add(new PingData(31.2231277, 120.9148989, 122));
    cityList[1].pings.add(new PingData(31.1440299, 121.4306818, 154));
    cityList[1].pings.add(new PingData(31.2684233, 121.5421838,153));
    cityList[2].pings.add(new PingData(39.9385449, 116.1165817, 205));
    cityList[2].pings.add(new PingData(39.9445038, 116.4851008, 192));
    cityList[2].pings.add(new PingData(39.8291187, 116.12079, 213));
    cityList[3].pings.add(new PingData(25.1921412, 66.5935954, 53));
    cityList[4].pings.add(new PingData(41.1922843, 28.3817107, 87));
    cityList[5].pings.add(new PingData(23.7805729, 90.2788949, 117));
    cityList[6].pings.add(new PingData(35.5040273, 138.6457897, 14));
    cityList[6].pings.add(new PingData(35.6434372, 139.7400523, 3));
    cityList[6].pings.add(new PingData(35.6527779, 139.7103776, 10));
    cityList[7].pings.add(new PingData(55.5807417, 36.8237404, 5));
    cityList[8].pings.add(new PingData(14.5676285, 120.7397547, 54));
    cityList[9].pings.add(new PingData(39.1246947, 117.0146545, 188));
    cityList[10].pings.add(new PingData(44.4377397, 25.9542094, 46));
    cityList[10].pings.add(new PingData(44.4206436, 26.1467312, 52));
    cityList[10].pings.add(new PingData(44.4542507, 26.0188769, 37));

    quests.add(new Questss("Go to job by bicycle", 0));
    quests.add(new Questss("Plant a flower", 1));
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future  _createMarkerImageFromAsset() async {
    ImageConfiguration configuration = ImageConfiguration();
    greenMarker = await BitmapDescriptor.fromAssetImage(
        configuration, "assets/greenmarker.png");
    yellowMarker = await BitmapDescriptor.fromAssetImage(
        configuration, "assets/yellowmarker.png");
    orangeMarker = await BitmapDescriptor.fromAssetImage(
        configuration, "assets/orangemarker.png");
    redMarker = await BitmapDescriptor.fromAssetImage(
        configuration, "assets/redmarker.png");
    purpleMarker = await BitmapDescriptor.fromAssetImage(
        configuration, "assets/purplemarker.png");
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
    if (quality < 51) {
      return "Good";
    } else if (quality < 101) {
      return "Moderate";
    } else if (quality < 151) {
      return "Poor";
    } else if (quality < 201) {
      return "Unhealthy";
    } else {
      return "Dangerous";

    }
  }

  IconData getQualityIcon(int quality) {
    if (quality < 51) {
      return FontAwesomeIcons.grin;
    } else if (quality < 101) {
      return FontAwesomeIcons.meh;
    } else if (quality < 151) {
      return FontAwesomeIcons.frown;
    } else if (quality < 201) {
      return FontAwesomeIcons.sadTear;
    } else {
      return FontAwesomeIcons.exclamationCircle;

    }
  }

  Color getCardColor(int quality) {
    if (quality < 51) {
      return Colors.green.shade500;
    } else if (quality < 101) {
      return Colors.yellow.shade500;
    } else if (quality < 151) {
      return Colors.orange.shade600;
    } else if (quality < 201) {
      return Colors.red.shade400;
    } else {
      return Colors.purple.shade400;

    }
  }

  Color getCardDarkColor(int quality) {
    if (quality < 51) {
      return Colors.green.shade700;
    } else if (quality < 101) {
      return Colors.yellow.shade700;
    } else if (quality < 151) {
      return Colors.orange.shade800;
    } else if (quality < 201) {
      return Colors.red.shade600;
    } else {
      return Colors.purple.shade600;

    }
  }
}