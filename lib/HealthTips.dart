import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GlobalData.dart';
import 'LocationData.dart';
import 'TipsList.dart';

class HealthTips extends StatelessWidget {
  var globalData = GlobalData();
  final LocationData data;
  List<List<TipsList>> tipslist;

  HealthTips(this.data);

  createList() {
    tipslist = new List(3);
    tipslist[0] = new List();
    tipslist[1] = new List();
    tipslist[2] = new List();

    tipslist[0].add(
        new TipsList(Icons.directions_bike, "  Enjoy outdoor activities."));
    tipslist[0].add(new TipsList(
        FontAwesomeIcons.windows, "  Open your windows.")); //verde si galben
    tipslist[0].add(new TipsList(
        FontAwesomeIcons.airFreshener, "  Go outside.")); //verde si galben
    tipslist[1].add(new TipsList(FontAwesomeIcons.mask,
        "  Sensitive groups should wear a mask out."));
    tipslist[1].add(new TipsList(
        FontAwesomeIcons.running, "  Avoid exercising near busy roads."));
    tipslist[1].add(new TipsList(FontAwesomeIcons.campground,
        "  Postpone outdoor recreational activities."));
    tipslist[2].add(new TipsList(FontAwesomeIcons.windows,
        "  Close your windows to avoid dirty air."));
    tipslist[2].add(
        new TipsList(FontAwesomeIcons.mask, "  Wear a mask outdoors."));
    tipslist[2].add(new TipsList(
        FontAwesomeIcons.running, "  Avoid outdoor exercise.")); //rosu
  }
    List<TipsList> getTipsList(int quality) {
      if (quality < 100) {
        return tipslist[0];
      }
      if (quality < 151) {
        return tipslist[1];
      } else {
        return tipslist[2];
      }
    }

  @override
  Widget build(BuildContext context) {
    createList();
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:15.0, bottom: 15),
            child: Text("Health recommandations:",
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
          ),
          Column(
            children: <Widget>[
              tip(getTipsList(data.quality)[0].icon, getTipsList(data.quality)[0].string),
              tip(getTipsList(data.quality)[1].icon, getTipsList(data.quality)[1].string),
              tip(getTipsList(data.quality)[2].icon, getTipsList(data.quality)[2].string),
            ],
          )
        ],

      )
    );
  }
  Widget tip(IconData icon, String string) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.0),
      child: Row(
        children: <Widget>[
          Icon(icon, size: 20),
          Text(string,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 17,
              )),
        ],
      ),
    );
  }
}
