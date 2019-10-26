import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/DataObjects/City.dart';

class ProviderWidget extends StatelessWidget {
  City data;

  ProviderWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: !data.isPredicted ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "AQI provided by ",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Raleway'),
                ),
                Text(
                  data.provider,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                ),
              ],
            ) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: AutoSizeText(
                    "AQI is predicted using data from ",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Raleway'),
                  ),
                ),
                Text(
                  data.provider,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
