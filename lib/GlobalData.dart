import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:space_apps_project/user_location.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:space_apps_project/DataObjects/FunFact.dart';
import 'package:space_apps_project/DataObjects/City.dart';
import 'package:space_apps_project/DataObjects/Ping.dart';
import 'package:space_apps_project/DataObjects/Challenge.dart';

class GlobalData {
  //COLORS
  Color mainColor = Color.fromRGBO(116, 164, 209, 1);
  Color secondaryColor = Color.fromRGBO(89, 127, 166, 1);

  List<DocumentSnapshot> cityList;
  City mainCity;
  List<Challenge> quests;
  List<String> copy ;
  List<FunFact> funFacts;
  List<Ping> pings;
  Future cityAssigned;
  Future locationAssigned;
  UserLocation userLocation;
  bool isGPS = false;
  int score = 0;
  Future currentCity;
  static final GlobalData _singleton = GlobalData._internal();
  BitmapDescriptor greenMarker,
      yellowMarker,
      orangeMarker,
      redMarker,
      purpleMarker;
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
    funFacts.add(new FunFact(
        "Did you know that public transport reduces polution by 15%?",
        "https://www.thoughtco.com/public-transportation-for-fewer-emissions-1203955"));
    funFacts.add(new FunFact(
        "Trees and plants have a varying capacity to capture and/or filter air pollution.. ",
        "https://www.thoughtco.com/public-transportation-for-fewer-emissions-1203955"));
    funFacts.add(new FunFact(
        "Do you know the impact of using renewable energy?",
        "https://www.ucsusa.org/resources/environmental-impacts-renewable-energy-technologies"));
    funFacts.add(new FunFact(
        "Did you know that traffic jams increace carbon emissions?",
        "https://www.environmentalleader.com/2012/01/how-traffic-jams-affect-air-quality/"));

    quests.add(new Challenge("Use public transport today.", 0));
    quests.add(new Challenge("Use public transport today.", 1));
    quests.add(new Challenge("Plant a tree.", 2));
    getDataAboutPings();
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _createMarkerImageFromAsset() async {
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
      case "01d":
        return Icon(
          Icons.wb_sunny,
          color: Colors.yellow,
        );
        break;
      case "02d":
        return Icon(
          FontAwesomeIcons.cloudSun,
          color: Colors.blue,
        );
        break;
      case "03d":
        return Icon(
          Icons.wb_cloudy,
          color: Colors.grey,
        );
        break;
      case "04d":
        return Icon(
          Icons.wb_cloudy,
          color: Colors.grey,
        );
        break;
      case "09d":
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: Colors.grey,
        );
        break;
      case "10d":
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: Colors.grey,
        );
        break;
      case "11d":
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: Colors.grey,
        );
        break;
      case "13d":
        return Icon(
          FontAwesomeIcons.snowflake,
          color: Colors.grey,
        );
        break;
      case "50d":
        return Icon(
          Icons.wb_cloudy,
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
    pings.add(new Ping(map.values.toList()[1], map.values.toList()[0], map.values.toList()[2]));
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
