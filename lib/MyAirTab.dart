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
    return Center(
      child: globalData.quests.length != 0
          ? ListView(
              children:
                  globalData.quests.map((object) => quest(object)).toList())
          : congrts(),
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
                    globalData.copy.add(globalData.quests[id].quest);
                    globalData.quests.remove(globalData.quests[id]);
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
      'You have done your daily challanges !',
      '153 done the first quest.',
      '445 done the second quest.',
    ];
    final qst = ['Use public transport.', 'Plant a flower.'];
    return Column(
      children: <Widget>[
        Card(
            child: ListTile(
                title: Text(titles[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Raleway',
                    )))),
        Card(
            color: Color.fromRGBO(0, 204, 204, 1),
            child: ListTile(
                title: Text(qst[0],
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                    )))),
        Card(
            color: Color.fromRGBO(51, 153, 153, 1),
            child: ListTile(
                title: Text("445",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Raleway',
                    )))),
        Card(
            color: Color.fromRGBO(0, 204, 204, 1),
            child: ListTile(
                title: Text(qst[1],
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                    )))),
        Card(
            color: Color.fromRGBO(51, 153, 153, 1),
            child: ListTile(
              title: Text("153",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Raleway',
                  )),
            ))
      ],
    );
//    return ListView.builder(
//      itemCount: titles.length,
//      itemBuilder: (context, index) {
//        return Column(
//          children: <Widget>[
//            index == 0
//                ? Card(
//                    color: Colors.blue.shade300,
//                    child: ListTile(
//                      title: Text(titles[index],
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              fontSize: 35,
//                              fontWeight: FontWeight.bold,
//                              fontFamily: 'Raleway')),
//                    ),
//                  )
//                : Card(
//                    color: Colors.blue.shade100,
//                    child: ListTile(
//                        title: Text(titles[index],
//                            style: TextStyle(
//                              fontSize: 15,
//                              fontFamily: 'Raleway',
//                            )))),
//            Card(
//                color: Colors.blue.shade100,
//                child: ListTile(
//                    title: Text(globalData.quests[1].quest,
//                        style: TextStyle(
//                          fontSize: 15,
//                          fontFamily: 'Raleway',
//                        ))))
//          ],
//        );
//
//        ;
//      },
//    );
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
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'Raleway')),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton.icon(
                              color: Colors.blue.shade200,
                              icon: Icon(FontAwesomeIcons.check),
                              label: Text('Done ?',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway')),
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
