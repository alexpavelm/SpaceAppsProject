import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ExpandedCardView.dart';
import 'GlobalData.dart';
import 'WeatherCard.dart';

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
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExpandedCardView(globalData.mainCity)),
            );
          },
          child: Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color:globalData.getCardColor(globalData.mainCity.quality),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            globalData
                                .getQualityIcon(globalData.mainCity.quality),
                            size: 60,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:4, right: 4),
                            child: Text(
                              globalData
                                  .getQualityText(globalData.mainCity.quality),
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6)
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "AQI: ",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                globalData.mainCity.quality.toString(),
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6)
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                WeatherCard(globalData.mainCity.weatherData)

              ],
            ),
          ),
        ),
      ),
    );
    /*return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Row(
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
                  Card(
                    color:globalData.getCardColor(globalData.mainCity.quality),
                    child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          globalData
                              .getQualityIcon(globalData.mainCity.quality),
                          size: 60,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        Text(
                          globalData
                              .getQualityText(globalData.mainCity.quality),
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6)
                          ),
                        ),
                        Text(
                          "AQI: ",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          globalData.mainCity.quality.toString(),
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("date"),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: globalData.getWeatherIcon(
                                globalData.mainCity.weatherData.weather[0]),
                          ),
                          Text(
                            globalData.mainCity.weatherData.temperature[0]
                                    .toString() +
                                " °C",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("date"),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: globalData.getWeatherIcon(
                                globalData.mainCity.weatherData.weather[1]),
                          ),
                          Text(
                            globalData.mainCity.weatherData.temperature[1]
                                    .toString() +
                                " °C",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("date"),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: globalData.getWeatherIcon(
                                globalData.mainCity.weatherData.weather[2]),
                          ),
                          Text(
                            globalData.mainCity.weatherData.temperature[2]
                                    .toString() +
                                " °C",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("date"),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: globalData.getWeatherIcon(
                                globalData.mainCity.weatherData.weather[3]),
                          ),
                          Text(
                            globalData.mainCity.weatherData.temperature[3]
                                    .toString() +
                                " °C",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("date"),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: globalData.getWeatherIcon(
                                globalData.mainCity.weatherData.weather[4]),
                          ),
                          Text(
                            globalData.mainCity.weatherData.temperature[4]
                                    .toString() +
                                " °C",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
              ),
          ),
          ),
        ],
      ),
    );*/
  }

  Widget buildWeather(String data) {
    return Text(data);
  }
}
