import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/DataObjects/City.dart';
import 'package:space_apps_project/DataObjects/ForecastData.dart';
import 'package:http/http.dart' as http;

import '../../GlobalData.dart';

class Days5Forecast extends StatefulWidget {
  final City data;

  Days5Forecast(this.data);

  @override
  _Days5ForecastState createState() => _Days5ForecastState();
}

class _Days5ForecastState extends State<Days5Forecast> with AutomaticKeepAliveClientMixin{
  ForecastData forecastData;

  var globalData = GlobalData();
  bool isLoading;

  @override
  void initState() {
    super.initState();

    if(forecastData == null) {
      loadWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    //loadWeather();
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(getDayOfWeek(DateTime.now().add(Duration(days: 1)).weekday),
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway')),
                    Container(
                        height: 25,
                        child: globalData.getWeatherIcon("01d")
                    ),
                    Text(
                      "15°C",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Raleway'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(getDayOfWeek(DateTime.now().add(Duration(days: 2)).weekday),
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway')),
                    Container(
                        height: 25,
                        child: globalData.getWeatherIcon("01d")
                    ),
                    Text(
                      "17°C",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Raleway'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(getDayOfWeek(DateTime.now().add(Duration(days: 3)).weekday),
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway')),
                    Container(
                        height: 25,
                        child: globalData.getWeatherIcon("01d")
                    ),
                    Text(
                      "16°C",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Raleway'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(getDayOfWeek(DateTime.now().add(Duration(days: 4)).weekday),
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway')),
                    Container(
                        height: 25,
                        child: globalData.getWeatherIcon("01d")
                    ),
                    Text(
                      "15°C",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Raleway'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(getDayOfWeek(DateTime.now().add(Duration(days: 5)).weekday),
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway')),
                    Container(
                        height: 25,
                        child: globalData.getWeatherIcon("03d")
                    ),
                    Text(
                      "13°C",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Raleway'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });
    if (widget.data.forecast.statusCode == 200) {
      return setState(() {
        forecastData = new ForecastData.fromJson(jsonDecode(widget.data.forecast.body));

        isLoading = false;
      });
    }





    setState(() {
      isLoading = false;
    });
  }

  String getDayOfWeek(int day) {
    switch(day) {
      case 1: return "Mon."; break;
      case 2: return "Tue."; break;
      case 3: return "Wed."; break;
      case 4: return "Thu."; break;
      case 5: return "Fri."; break;
      case 6: return "Sat."; break;
      case 7: return "Sun."; break;
      default: return "OOPS."; break;
    }
  }

  @override
  bool get wantKeepAlive => false;
}
