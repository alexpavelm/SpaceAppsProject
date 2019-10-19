import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/SmallCard.dart';

import 'GlobalData.dart';

class CurrentLocation extends StatefulWidget {
  @override
  State<CurrentLocation> createState() {
    return CurrentLocationState();
  }
}

class CurrentLocationState extends State<CurrentLocation> {
  var globalData = GlobalData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 300,
                width: 400,
                child: Column(
                  children: [
                    Container(
//                      color: Color(0xFF57093E5),
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  globalData.mainCity.city,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      fontFamily: 'Raleway'),
                                ),
                                Text(
                                    "          "+globalData.mainCity.country,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontFamily: 'Raleway'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
//                              children: <Widget>[
//
//                                Icon(
//                                    SmallCard.getQualityIcon(globalData.mainCity.quality),
//                                    size: 35,
//                                    color: Colors.black.withOpacity(0.6)),
//                                Icon(
//                                    SmallCard.getWeatherIcon(globalData.mainCity.weather),
//                                    size: 35,
//                                    color: Colors.black.withOpacity(0.6))
//                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
//                      color: Color(0xFF85AAFF),
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "current city",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
