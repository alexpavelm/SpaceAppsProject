import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:space_apps_project/DateFormat.dart';

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
                  padding: const EdgeInsets.only(top: 40, bottom: 40),
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
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          printCurrentDate(),
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontStyle: FontStyle.italic
                          ),
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
  }

  Widget buildWeather(String data) {
    return Text(data);
  }

  String printCurrentDate() {
    var now = DateTime.now();
    String date = "";
    switch(now.weekday) {
      case 1:
        date += "Monday, ";
        break;
      case 2:
        date += "Tuesday, ";
        break;
      case 3:
        date += "Wednesday, ";
        break;
      case 4:
        date += "Thursday, ";
        break;
      case 5:
        date += "Friday, ";
        break;
      case 6:
        date += "Saturday, ";
        break;
      case 7:
        date += "Sunday, ";
        break;
      default:
        date += "error";
        break;
    }
    date += now.day.toString() + " ";
    switch(now.month) {
      case 1:
        date += "Jan ";
        break;
      case 2:
        date += "Feb ";
        break;
      case 3:
        date += "Mar ";
        break;
      case 4:
        date += "Apr ";
        break;
      case 5:
        date += "May ";
        break;
      case 6:
        date += "Jun ";
        break;
      case 7:
        date += "Jul ";
        break;
      case 8:
        date += "Aug ";
        break;
      case 9:
        date += "Sep ";
        break;
      case 10:
        date += "October ";
        break;
      case 11:
        date += "Nov";
        break;
      case 12:
        date += "Dec ";
        break;
      default:
        date += "error";
        break;
    }
    return date + now.year.toString();
  }
}
