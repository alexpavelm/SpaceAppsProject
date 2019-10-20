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
                    size: 35, color: Colors.black.withOpacity(0.6)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(globalData.getQualityText(data.quality),
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
                      Text(data.quality.toString(),
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
      ),
    );
  }
}
