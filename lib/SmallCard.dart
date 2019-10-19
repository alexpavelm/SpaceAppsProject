import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GlobalData.dart';
import 'LocationData.dart';

class SmallCard extends StatefulWidget {
  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  var globalData = GlobalData();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: globalData.cityList.map((object) => buildCard(object)).toList(),
      ),
    );
  }

  Widget buildCard(LocationData data) {
    return card(data.city, data.country, data.quality, data.temperature[0], data.weather[0]);
  }

  Widget card(String city, String country, int quality, int temperature,
      String weather) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 150,
                color: getCardColor(quality),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      color: getCardDarkColor(quality),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  city,
                                  style: TextStyle(fontSize: 23, fontFamily: 'Raleway'),
                                ),
                                Text(country,
                                    style:
                                        TextStyle(fontSize: 15, fontFamily: 'Raleway')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(getQualityIcon(quality), size: 35, color: Colors.black.withOpacity(0.6),),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: AutoSizeText(
                                getQualityText(quality),
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Raleway',
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
              SizedBox.shrink(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("AQI: ", style: TextStyle(fontFamily: 'Raleway'),),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            quality.toString(),
                            style: TextStyle(fontSize: 25, fontFamily: 'Raleway',
                              color: getCardColor(quality), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        getWeatherIcon(weather),
                        Text(
                          temperature.toString() + "*C",
                          style: TextStyle(fontSize: 25, fontFamily: 'Raleway'),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
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
          Icons.grain,
          color: Colors.white,
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
    if (quality < 50) {
      return "Good";
    } else if (quality < 100) {
      return "Moderate";
    } else if (quality < 150) {
      return "Bad";
    } else if (quality < 200) {
      return "Unhealthy";
    }
    return "RUN AWAY";
  }

  IconData getQualityIcon(int quality) {
    if (quality < 50) {
      return FontAwesomeIcons.grin;
    } else if (quality < 100) {
      return FontAwesomeIcons.meh;
    } else if (quality < 150) {
      return FontAwesomeIcons.frown;
    } else if (quality < 200) {
      return FontAwesomeIcons.dizzy;
    }
    return FontAwesomeIcons.dizzy;
  }

  Color getCardColor(int quality) {
    if (quality < 50) {
      return Colors.green.shade500;
    } else if (quality < 100) {
      return Colors.orange.shade500;
    } else if (quality < 150) {
      return Colors.red.shade500;
    } else if (quality < 200) {
      return Colors.purple.shade500;
    }
    return Colors.teal.shade500;
  }

  Color getCardDarkColor(int quality) {
    if (quality < 50) {
      return Colors.green.shade700;
    } else if (quality < 100) {
      return Colors.orange.shade700;
    } else if (quality < 150) {
      return Colors.red.shade700;
    } else if (quality < 200) {
      return Colors.purple.shade700;
    }
    return Colors.teal.shade700;
  }
}
