import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:space_apps_project/MainView/ExpandedCityView/ExpandedCardView.dart';
import 'package:space_apps_project/DataObjects/City.dart';

import '../GlobalData.dart';
import '3DaysForecast.dart';
import 'WeatherWidget.dart';

class CitiesView extends StatefulWidget {
  @override
  _CitiesViewState createState() => _CitiesViewState();
}

class _CitiesViewState extends State<CitiesView> with AutomaticKeepAliveClientMixin{
  var globalData = GlobalData();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('cities').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        globalData.cityList = snapshot.data.documents;
        //globalData.mainCity = City.fromSnapshot(globalData.cityList[0]);
        return buildList(globalData.cityList);
      },
    );
  }

  Widget buildList(List<DocumentSnapshot> snapshot) {
    return Column(
      children: snapshot.map((data) => card(City.fromSnapshot(data))).toList(),
    );
  }

  Widget card(City data) {
    String city = data.name;
    String country = data.country;
    int quality = data.aqi;
    //List<int> temperature = data.weatherData.temperature;
    //List<String> weather = data.weatherData.weather;
    return Hero(
      tag: city,
      child: Material(
        child: InkWell(
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
                                  Container(
                                    width: 134,
                                    child: Column(
                                      children: <Widget>[
                                        AutoSizeText(
                                          city,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontFamily: 'Raleway'),
                                        ),
                                        AutoSizeText(country,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Raleway')),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                globalData.getQualityIcon(quality),
                                size: 35,
                                color: Colors.black.withOpacity(0.6),
                              ),
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
                                padding:
                                    const EdgeInsets.only(left: 20, top: 5),
                                child: WeatherWidget(data)
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "AQI: ",
                                      style: TextStyle(fontFamily: 'Raleway'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        quality.toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Raleway',
                                            color: globalData
                                                .getCardDarkColor(quality),
                                            fontWeight: FontWeight.bold),
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
                          Days3Forecast(data)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
