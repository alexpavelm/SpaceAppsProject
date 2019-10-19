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
                color: globalData.getCardColor(quality),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      color: globalData.getCardDarkColor(quality),
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
                            Icon(globalData.getQualityIcon(quality), size: 35, color: Colors.black.withOpacity(0.6),),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: AutoSizeText(
                                globalData.getQualityText(quality),
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
                              color: globalData.getCardColor(quality), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        globalData.getWeatherIcon(weather),
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
}
