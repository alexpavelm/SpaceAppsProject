import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GlobalData.dart';
import 'LocationData.dart';
import 'WeatherData.dart';

class WeatherCard extends StatelessWidget {
  final WeatherData data;
  final globalData = GlobalData();

  WeatherCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
          height: 130,
          color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                  child: Text("5-DAY FORECAST", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Sun."),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[0]),
                          ),
                          Text(
                            data.temperature[0].toString() + "*C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Mon."),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[1]),
                          ),
                          Text(
                            data.temperature[1].toString() + "*C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Tue."),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[2]),
                          ),
                          Text(
                            data.temperature[2].toString() + "*C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Wed."),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[3]),
                          ),
                          Text(
                            data.temperature[3].toString() + "*C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Thu."),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[4]),
                          ),
                          Text(
                            data.temperature[4].toString() + "*C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
