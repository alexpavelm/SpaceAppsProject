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
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Card(
          color: globalData.getCardColor(data.quality),
          elevation: 0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Icon(globalData.getQualityIcon(data.quality),
                    size: 35, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(globalData.getQualityText(data.quality),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 25,
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(data.quality.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Raleway',
                            fontSize: 45,
                          )),
                      Text("US AQI ",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
