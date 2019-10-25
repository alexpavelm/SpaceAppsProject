import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/DataObjects/City.dart';
import 'package:space_apps_project/MainView/ExpandedCityView/HealthTips.dart';
import 'package:space_apps_project/MainView/ExpandedCityView/QualityCard.dart';
import 'package:space_apps_project/MainView/WeatherWidget.dart';

import '../../GlobalData.dart';
import '5DaysForecast.dart';
import 'MyMap.dart';
import 'ProviderWidget.dart';

class ExpandedCardView extends StatelessWidget {
  final City data;
  final globalData = GlobalData();

  ExpandedCardView(this.data);

  Widget _flightShuttleBuilder(
      BuildContext flightContext,
      Animation<double> animation,
      HeroFlightDirection flightDirection,
      BuildContext fromHeroContext,
      BuildContext toHeroContext,
      ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: Hero(
                  tag: data.name,
                  flightShuttleBuilder: _flightShuttleBuilder,
                  child: Text(data.name,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 35),
                  child: Text(data.country,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 17,
                          color: Colors.black87
                      )),
                ),
              ),
              QualityCard(data),
              ProviderWidget(data),
              Days5Forecast(data),
              HealthTips(data),
              MyMap(data),
            ],
          )

      ),
    );
  }
}
