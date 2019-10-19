import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: globalData.quests.map((object) => quest(object)).toList()
      ),
    );
  }

  Widget quest(Questss data) {
    String qst = data.quest;
    return Padding(
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
                      globalData.quests.remove(globalData.quests[data.id]);
                      print(globalData.quests.length);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}



