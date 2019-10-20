import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'GlobalData.dart';
import 'Questss.dart';


class MyAirTab extends StatefulWidget {
  @override
  State<MyAirTab> createState() {
    return MyAirTabState();
  }
}

class MyAirTabState extends State<MyAirTab> {
  var globalData = GlobalData();
  bool donetxt = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          children: globalData.quests.map((object) => quest(object)).toList()),
    );
  }

  Widget quest(Questss data) {
    String qst = data.quest;
    return data.finishquests == false
        ? Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(qst,
                        style: TextStyle(fontSize: 25, fontFamily: 'Raleway')),
                    FlatButton.icon(
                        color: Colors.red,
                        icon: Icon(Icons.sentiment_very_satisfied),
                        label: Text('Done it ?'),
                        onPressed: () {
                          setState(() {
                            if (globalData.quests.length == 1) {
                              globalData.quests = new List();
                              globalData.quests.add(
                                  new Questss("Congratulations! You have finished your challanges!", -1));
                              globalData.quests[0].finishquests = true;
                            } else {
                              globalData.quests
                                  .remove(globalData.quests[data.id]);
                            }
                          });
                        }),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(2.0),

            child: Card(
              color: Colors.green.shade700,
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 100,
                child: Center(
                  child: new Text(qst,
                      style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          );
  }
}
