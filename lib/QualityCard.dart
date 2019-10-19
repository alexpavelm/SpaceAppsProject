import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GlobalData.dart';
import 'LocationData.dart';

class QualityCard extends StatelessWidget {
  final LocationData data;
  final globalData = GlobalData();

  QualityCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
//color: globalData.getCardColor(data.quality),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
          color: Colors.white70,
          elevation: 0,
          shape: Border(
              left: BorderSide(
                  color: globalData.getCardColor(data.quality), width: 20)),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Icon(globalData.getQualityIcon(data.quality),
                    size: 45, color: Colors.black.withOpacity(0.6)),
              ),
              Expanded(
                  child: Text(data.quality.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: globalData.getCardColor(data.quality),
                        fontFamily: 'Raleway',
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      )))
//                        globalData.getWeatherIcon(data.weather[0]),
//                        Padding(
//                          padding: const EdgeInsets.all(5.0),
//                          child: Text(data.temperature[0].toString(),
//                          style: TextStyle(
//                            fontSize: 25,
//                            fontFamily: 'Raleway',
//                            fontWeight: FontWeight.bold,
//                          )),
//                        ),
            ],
          ),
        ),
      ),
    );
  }
}
