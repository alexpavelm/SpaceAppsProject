import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ExpandedCardView.dart';
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

        children: globalData.cityList.map((object) => card(object)).toList(),
      ),
    );
  }

  Widget card(LocationData data) {
    String city = data.city;
    String country = data.country;
    int quality = data.quality;
    List<int> temperature = data.temperature;
    List<String> weather = data.weather;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ExpandedCardView(data)),
        );
      },
      child: Padding(
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Row(
                              children: <Widget>[
                                globalData.getWeatherIcon(weather[0]),
                                Text(
                                  temperature[0].toString() + "*C",
                                  style: TextStyle(fontSize: 23, fontFamily: 'Raleway'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
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
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 5, bottom: 2),
                              child: Column(
                                children: <Widget>[
                                  Text("Mon."),
                                  globalData.getWeatherIcon(weather[1]),
                                  Text(
                                    temperature[1].toString() + "*C",
                                    style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
                              child: Column(
                                children: <Widget>[
                                  Text("Tue."),
                                  globalData.getWeatherIcon(weather[2]),
                                  Text(
                                    temperature[2].toString() + "*C",
                                    style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 20, bottom: 2),
                              child: Column(
                                children: <Widget>[
                                  Text("Wed."),
                                  globalData.getWeatherIcon(weather[3]),
                                  Text(
                                    temperature[3].toString() + "*C",
                                    style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],

                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
