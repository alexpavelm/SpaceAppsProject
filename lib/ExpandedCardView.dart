import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/HealthTips.dart';
import 'package:space_apps_project/QualityCard.dart';
import 'package:space_apps_project/WeatherCard.dart';

import 'GlobalData.dart';
import 'LocationData.dart';
import 'MyMap.dart';

class ExpandedCardView extends StatelessWidget {
  final LocationData data;
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
          child: Column(
            children: <Widget>[
              Hero(
                tag: data.city,
                flightShuttleBuilder: _flightShuttleBuilder,
                child: Text(data.city,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6, bottom: 35),
                child: Text(data.country,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 17,
                        color: Colors.black87
                    )),
              ),
              QualityCard(data),
              WeatherCard(data.weatherData),
              HealthTips(),
              MyMap(data),
            ],
          )

      ),
    );
  }
}
