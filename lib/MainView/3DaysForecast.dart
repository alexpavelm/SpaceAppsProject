import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/DataObjects/City.dart';
import 'package:space_apps_project/DataObjects/ForecastData.dart';
import 'package:http/http.dart' as http;

import '../GlobalData.dart';

class Days3Forecast extends StatefulWidget {
  final City data;

  Days3Forecast(this.data);

  @override
  _Days3ForecastState createState() => _Days3ForecastState();
}

class _Days3ForecastState extends State<Days3Forecast> with AutomaticKeepAliveClientMixin{
  ForecastData forecastData;

  var globalData = GlobalData();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    if(forecastData == null) {
      loadWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading ? Container() : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 5, bottom: 2),
              child: Column(
                children: <Widget>[
                  Text(getDayOfWeek(DateTime.now().add(Duration(days: 1)).weekday),
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Raleway')),
                  Container(
                    height: 25,
                    child: globalData.getWeatherIcon(forecastData.list[0].icon)
                  ),
                  Text(
                    forecastData.list[0].temp.floor().toString() + "°C",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Raleway'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5, right: 5, bottom: 2),
              child: Column(
                children: <Widget>[
                  Text(getDayOfWeek(DateTime.now().add(Duration(days: 2)).weekday),
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Raleway')),
                  Container(
                    height: 25,
                    child: globalData.getWeatherIcon(forecastData.list[1].icon)
                  ),
                  Text(
                    forecastData.list[1].temp.floor().toString() + "°C",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Raleway'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5, right: 20, bottom: 2),
              child: Column(
                children: <Widget>[
                  Text(getDayOfWeek(DateTime.now().add(Duration(days: 3)).weekday),
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Raleway')),
                  Container(
                    height: 25,
                    child: globalData.getWeatherIcon(forecastData.list[2].icon)
                  ),
                  Text(
                    forecastData.list[2].temp.floor().toString() + "°C",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Raleway'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    final lat = widget.data.lat;
    final lon = widget.data.long;
    if(widget.data.forecast == null) {
      widget.data.forecast = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?APPID=28a50b82164ccaedebaed3d2898215a4&lat=${lat
              .toString()}&lon=${lon.toString()}&units=metric');
      if (widget.data.forecast.statusCode == 200) {
        return setState(() {
          forecastData = new ForecastData.fromJson(jsonDecode(widget.data.forecast.body));

          isLoading = false;
        });
      }
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
  bool get wantKeepAlive => true;
}
