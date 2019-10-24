import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:space_apps_project/DataObjects/FunFact.dart';
import 'package:space_apps_project/DataObjects/City.dart';
import 'package:space_apps_project/DataObjects/Ping.dart';
import 'package:space_apps_project/DataObjects/Challenge.dart';

import 'DataObjects/WeatherData.dart';

class GlobalData {
  List<DocumentSnapshot> cityList;
  City mainCity;
  List<Challenge> quests;
  List<String> copy ;
  List<FunFact> funFacts;
  List<Ping> pings;
  Future cityAssigned;
  int score = 0;
  static final GlobalData _singleton = GlobalData._internal();
  BitmapDescriptor greenMarker, yellowMarker, orangeMarker, redMarker, purpleMarker;
  final databaseReference = Firestore.instance;
  factory GlobalData() {
    return _singleton;
  }
  void getDataAboutPings() {
    databaseReference
        .collection("pings")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => saveData(f.data));
    });
  }
  GlobalData._internal();
  void create() {
    _createMarkerImageFromAsset();
    funFacts = new List();
    cityList = new List();
    quests = new List();
    copy = new List();
    pings = new List();
    funFacts.add(new FunFact("Did you know that public transport reduces polution by 15%?", "https://www.thoughtco.com/public-transportation-for-fewer-emissions-1203955"));
    funFacts.add(new FunFact("Trees and plants have a varying capacity to capture and/or filter air pollution.. ", "https://www.thoughtco.com/public-transportation-for-fewer-emissions-1203955"));
    funFacts.add(new FunFact("Do you know the impact of using renewable energy?", "https://www.ucsusa.org/resources/environmental-impacts-renewable-energy-technologies"));
    funFacts.add(new FunFact("Did you know that traffic jams increace carbon emissions?", "https://www.environmentalleader.com/2012/01/how-traffic-jams-affect-air-quality/"));

   /* cityList.add(new City("Amsterdam", "Netherlands", new WeatherData(["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15]), 23, []));
    cityList.add(new City("Shanghai", "China", new WeatherData(["sunny", "cloudy", "cloudy", "cloudy", "rainy"], [20, 23, 23, 20, 23]), 152, []));
    cityList.add(new City("Beijing", "China", new WeatherData(["sunny", "sunny", "sunny", "cloudy", "cloudy"], [18, 16, 18, 19, 11]), 215, []));
    cityList.add(new City("Paris", "France", new WeatherData(["rainy", "rainy", "cloudy", "sunny", "sunny"], [13, 14, 14, 20, 20]), 53, []));
    cityList.add(new City("Istanbul", "Turkey", new WeatherData(["sunny", "cloudy", "sunny", "rainy", "rainy"], [20, 20, 19, 19, 19]), 114, []));
    cityList.add(new City("London", "England", new WeatherData(["sunny", "rainy", "sunny", "sunny", "rainy"], [13, 14, 14, 15, 17]), 62, []));
    cityList.add(new City("Tokyo", "Japan", new WeatherData(["cloudy", "cloudy", "rainy", "cloudy", "cloudy"], [25, 23, 16, 23, 20]), 70, []));
    cityList.add(new City("Moscow", "Russia", new WeatherData(["cloudy", "cloudy", "cloudy", "cloudy", "cloudy"], [14, 14, 8, 14, 11]), 60, []));
    cityList.add(new City("New York", "USA", new WeatherData(["rainy", "cloudy", "rainy", "sunny", "sunny"], [18, 21, 18, 17, 18]), 60, []));
    cityList.add(new City("Berlin", "Germany", new WeatherData(["sunny", "sunny", "sunny", "sunny", "sunny"], [20, 21, 17, 17, 19]), 20, []));
    cityList.add(new City("Bucharest", "Romania", new WeatherData(["sunny", "sunny", "sunny", "sunny", "sunny"], [24, 22, 23, 21, 21]), 74, []));
    cityList.add(new City("Buzau", "Romania", new WeatherData(["sunny", "sunny", "cloudy", "rainy", "sunny"], [22, 19, 18, 20, 17]), 19, []));


    cityList[0].pings.add(new Ping(52.3545358, 4.7635337, 23));
    cityList[0].pings.add(new Ping(52.3521007, 4.886793, 34));
    cityList[0].pings.add(new Ping(52.3478447, 4.7966966, 13));
    cityList[0].pings.add(new Ping(52.3762867, 4.8651617, 55));
    cityList[0].pings.add(new Ping(52.3780961, 4.8359141, 27));
    cityList[1].pings.add(new Ping(31.2231277, 120.9148989, 122));
    cityList[1].pings.add(new Ping(31.1440299, 121.4306818, 154));
    cityList[1].pings.add(new Ping(31.2684233, 121.5421838,153));
    cityList[2].pings.add(new Ping(39.9385449, 116.1165817, 205));
    cityList[2].pings.add(new Ping(39.9445038, 116.4851008, 192));
    cityList[2].pings.add(new Ping(39.8291187, 116.12079, 213));
    cityList[3].pings.add(new Ping(48.8564659, 2.3466072, 58));
    cityList[3].pings.add(new Ping(48.8526961, 2.3008068, 12));
    cityList[3].pings.add(new Ping(48.8438557, 2.3195398, 36));
    cityList[4].pings.add(new Ping(41.1922843, 28.3817107, 87));
    cityList[5].pings.add(new Ping(51.5076624, -0.1426867, 62));
    cityList[5].pings.add(new Ping(51.4975425, -0.1439461, 42));
    cityList[5].pings.add(new Ping(51.5136513, -0.1018143, 55));
    cityList[6].pings.add(new Ping(35.5040273, 138.6457897, 14));
    cityList[6].pings.add(new Ping(35.6434372, 139.7400523, 3));
    cityList[6].pings.add(new Ping(35.6527779, 139.7103776, 10));
    cityList[7].pings.add(new Ping(55.5807417, 36.8237404, 5));
    cityList[8].pings.add(new Ping(40.7077029, -74.014515, 30));
    cityList[8].pings.add(new Ping(40.7644976, -73.9864182, 31));
    cityList[8].pings.add(new Ping(40.6853428, -73.9105466, 38));
    cityList[8].pings.add(new Ping(40.7177145, -74.0474245, 56));
    cityList[8].pings.add(new Ping(40.6463789, -74.1526531, 40));
    cityList[9].pings.add(new Ping(52.5178642, 13.3978216, 20));
    cityList[9].pings.add(new Ping(52.5223822, 13.3949681, 12));
    cityList[9].pings.add(new Ping(52.5143651, 13.4184857, 15));
    cityList[10].pings.add(new Ping(44.4377397, 25.9542094, 46));
    cityList[10].pings.add(new Ping(44.4206436, 26.1467312, 52));
    cityList[10].pings.add(new Ping(44.4542507, 26.0188769, 37));
    cityList[11].pings.add(new Ping(45.146942, 26.810281, 19));*/

    quests.add(new Challenge("Use public transport today.", 0));
    quests.add(new Challenge("Plant a tree.", 1));
    quests.add(new Challenge("Your score", 2));
    getDataAboutPings();
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

  FunFact getFunFact() {
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
  saveData(Map<String, dynamic> map) async {
    print('saveData');
    pings.add(new Ping(map.values.toList()[1], map.values.toList()[0], map.values.toList()[2]));
    //print(map.values.toList()[2]);
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