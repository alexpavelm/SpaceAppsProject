import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
//        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 350,
                child: Column(
                  children: <Widget>[
                    Container(
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
//                      color:
//                          globalData.getCardColor(globalData.mainCity.quality),
                      height: 80,
                      child: Card(
                        color:globalData.getCardColor(globalData.mainCity.quality),
                        child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 22, bottom: 5),
                              child: Icon(
                                globalData
                                    .getQualityIcon(globalData.mainCity.quality),
                                size: 60,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 47),
                              child: Text(
                                globalData
                                    .getQualityText(globalData.mainCity.quality),
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 44, top: 15),
                              child: Text(
                                "AQI: ",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Text(
                                globalData.mainCity.quality.toString(),
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
//                      color:
//                          globalData.getCardColor(globalData.mainCity.quality),
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              width: 72,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text("date"),
                                  getWeatherIcon(
                                      globalData.mainCity.weatherData.weather[0]),
                                  Text(
                                    globalData.mainCity.weatherData.temperature[0]
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
                                  Text("date"),
                                  getWeatherIcon(
                                      globalData.mainCity.weatherData.weather[1]),
                                  Text(
                                    globalData.mainCity.weatherData.temperature[1]
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
                                  Text("date"),
                                  getWeatherIcon(
                                      globalData.mainCity.weatherData.weather[2]),
                                  Text(
                                    globalData.mainCity.weatherData.temperature[2]
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
                                  Text("date"),
                                  getWeatherIcon(
                                      globalData.mainCity.weatherData.weather[3]),
                                  Text(
                                    globalData.mainCity.weatherData.temperature[3]
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
                                  Text("date"),
                                  getWeatherIcon(
                                      globalData.mainCity.weatherData.weather[4]),
                                  Text(
                                    globalData.mainCity.weatherData.temperature[4]
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
