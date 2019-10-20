import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Challenges", style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: globalData.quests.length != 0 ?ListView(
            children: globalData.quests.map((object) => quest(object)).toList()) : Text("HAHA"),
      ),
    );
  }

  Future confirmDialog(int id) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Please confirm"),
            actions: <Widget>[
              new FlatButton(
                child: new Text('YES'),
                onPressed: () {
                  setState(() {

                      globalData.quests
                          .remove(globalData.quests[id]);
                  });
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget congrts() {
    final titles = [
      'You completed your daily challenges',
      '153 did the first quest',
      '445 did the second quest',
      '129 did the third quest'
    ];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return index == 0
            ? Card(
                //                           <-- Card widget
                child: ListTile(
                  title: Text(titles[index],
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway')),
                ),
              )
            : Card(
                //                           <-- Card widget
                child: ListTile(
                    title: Text(titles[index],
                        style:
                            TextStyle(fontSize: 15, fontFamily: 'Raleway'))));
      },
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(qst,
                            style: TextStyle(fontSize: 25, fontFamily: 'Raleway')),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton.icon(
                              color: Colors.blue.shade200,
                              icon: Icon(FontAwesomeIcons.check),
                              label: Text('Done it?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Raleway')),
                              onPressed: () {
                                confirmDialog(data.id);
                              }),
                        ),
                      ],
                    ),
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
