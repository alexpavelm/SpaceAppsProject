import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/SmallCard.dart';
import 'package:space_apps_project/WeatherData.dart';

import 'GlobalData.dart';
import 'LocationData.dart';

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
//        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 330,
                child: Column(
                  children: <Widget>[
                    Container(
//                      color: Colors.lightBlue,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(globalData.mainCity.city,
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 3,
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                globalData.mainCity.country,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
//                      color: Colors.grey,
                      height: 80,
                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              globalData.getQualityIcon(
                                  globalData.mainCity.quality),
                              size: 50,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          Text(
                            globalData.getQualityText(globalData.mainCity.quality),
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "Air Quality Today: " + globalData.mainCity.quality.toString(),
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            width: 72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                getWeatherIcon(
                                    globalData.weatherData.weather[0]),
                                Text(
                                  globalData.weatherData.temperature[0]
                                          .toString() +
                                      " °C",
                                  textScaleFactor: 2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                getWeatherIcon(
                                    globalData.weatherData.weather[1]),
                                Text(
                                  globalData.weatherData.temperature[1]
                                          .toString() +
                                      " °C",
                                  textScaleFactor: 2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                getWeatherIcon(
                                    globalData.weatherData.weather[2]),
                                Text(
                                  globalData.weatherData.temperature[2]
                                          .toString() +
                                      " °C",
                                  textScaleFactor: 2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                getWeatherIcon(
                                    globalData.weatherData.weather[3]),
                                Text(
                                  globalData.weatherData.temperature[3]
                                          .toString() +
                                      " °C",
                                  textScaleFactor: 2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 72,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                getWeatherIcon(
                                    globalData.weatherData.weather[4]),
                                Text(
                                  globalData.weatherData.temperature[4]
                                          .toString() +
                                      " °C",
                                  textScaleFactor: 2,
                                ),
                              ],
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

  Icon getWeatherIcon(String weather) {
    switch (weather) {
      case "sunny":
        return Icon(
          Icons.wb_sunny,
          color: Colors.yellow,
          size: 40,
        );
        break;
      case "cloudy":
        return Icon(
          Icons.wb_cloudy,
          color: Colors.blue,
          size: 40,
        );
        break;
      case "rainy":
        return Icon(
          Icons.grain,
          color: Colors.white,
          size: 40,
        );
        break;
      default:
        return Icon(
          Icons.wb_sunny,
          color: Colors.yellow,
          size: 40,
        );
        break;
    }
  }

  Widget buildWeather(String data) {
    return Text(data);
  }
}
