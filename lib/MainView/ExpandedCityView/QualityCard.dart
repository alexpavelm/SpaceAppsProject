import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:space_apps_project/DataObjects/City.dart';

import '../../GlobalData.dart';

class QualityCard extends StatelessWidget {
  final City data;
  final globalData = GlobalData();

  QualityCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        color: globalData.getCardColor(data.aqi),
        elevation: 0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Icon(globalData.getQualityIcon(data.aqi),
                  size: 35, color: Colors.black.withOpacity(0.6)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(globalData.getQualityText(data.aqi),
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: 'Raleway',
                    fontSize: 25,
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right:5, top: 12),
                      child: Text("AQI:",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 15
                          )),
                    ),
                    Text(data.aqi.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: 'Raleway',
                          fontSize: 45,
                        )),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
