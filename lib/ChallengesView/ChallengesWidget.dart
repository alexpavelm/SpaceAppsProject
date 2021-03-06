import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../GlobalData.dart';
import '../DataObjects/Challenge.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:qr_flutter/qr_flutter.dart';

class ChallengesWidget extends StatefulWidget {
  @override
  State<ChallengesWidget> createState() {
    return ChallengesWidgetState();
  }
}

class ChallengesWidgetState extends State<ChallengesWidget> {
  var globalData = GlobalData();
  int scoreToPrint;
  String barcode = "";
  @override
  Widget build(BuildContext context) {
    scoreToPrint = 0;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              "Challenges",
              style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),
            )),
        backgroundColor: globalData.mainColor,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: globalData.quests.length != 1
                ? Container(
                height: 70 * globalData.quests.length.toDouble(),
                child: ListView(
                    children: globalData.quests
                        .map((object) => quest(object))
                        .toList()))
                : congrts(),
          ),
          InkWell(
            child: Padding(
              padding:
              const EdgeInsets.only(left: 8, top: 20, bottom: 20, right: 8),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.infoCircle,
                        color: globalData.mainColor, size: 30),
                    Container(
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "315 people chose to use public transport over a personal car in the last 7 days",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding:
              const EdgeInsets.only(left: 8, top: 20, bottom: 20, right: 8),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.infoCircle,
                        color: globalData.mainColor, size: 30),
                    Container(
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Is it hot in the city? Try planting a tree!",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding:
              const EdgeInsets.only(left: 8, top: 20, bottom: 20, right: 8),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.infoCircle,
                        color: globalData.mainColor, size: 30),
                    Container(
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "The best ways to reduce air pollution are by walking and riding bicycle.",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future qrScanner(Challenge id) async{


    String cameraScanResult = await scanner.scan();
    print(cameraScanResult);
    if(cameraScanResult == 'Add 100 points'){
      globalData.score += 100;
      setState(() {
        globalData.quests.remove(id);
      });
    }
    return null;
  }


  Widget congrts() {
    final titles = [
      'You completed your weekly challanges !',
      ' did the first quest.',
      ' did the second quest.',
    ];
    final qst = ['Use public transport today.', 'Plant a tree.'];
    //Icon(FontAwesomeIcons.adn);
    var toPrintScore = "AirPoints: " + globalData.score.toString() + " ";
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
          child: Text(titles[0],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Raleway',
              )),
        ),
        Card(
            color: globalData.secondaryColor,
            child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(qst[0],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Raleway',
                        )),
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  ],
                ))),
        Card(
            color: globalData.secondaryColor,
            child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(qst[1],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Raleway',
                        )),
                    Icon(Icons.check, color: Colors.white)
                  ],
                ))),
        Card(
          color: Colors.green.shade700,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 35,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(toPrintScore,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            color: Colors.white),
                        textAlign: TextAlign.center),
                    Icon(
                      FontAwesomeIcons.leaf,
                      size: 15,
                      color: Colors.white,
                    ),
                  ],
                )),
          ),
        ),
        new Divider(
          thickness: 10,
          indent: 6,
          endIndent: 6,
        ),
      ],
    );
  }

  Future confirmDialog(Challenge id) {
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
                    //globalData.copy.add(globalData.quests[id].quest);
                    globalData.quests.remove(id);
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

  /*
  * Create the format for the quest
  * */

  Widget quest(Challenge data) {
    String qst = data.quest;
    // Special quest
    if(data.id == 3){
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new AutoSizeText(qst,
                        maxLines: 1,
                        maxFontSize: 20,
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'Raleway')),
                    Icon(
                      FontAwesomeIcons.leaf,
                      size: 15,
                      color: Colors.green,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton (
                          color: globalData.special,
                          child: Text('Scan it',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Raleway')),
                          onPressed: () {
                            qrScanner(data);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    };
    if (scoreToPrint == 0) {
      scoreToPrint++;

      var toPrintScore = "AirPoints: " + globalData.score.toString() + " ";
      return Card(
        color: Colors.green.shade700,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 35,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(toPrintScore,
                    style: TextStyle(fontSize: 20, fontFamily: 'Raleway', color: Colors.white),
                    textAlign: TextAlign.center),
                Icon(
                  FontAwesomeIcons.leaf,
                  size: 15,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      scoreToPrint++;
      return data.finishquests == false
          ? Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new AutoSizeText(qst,
                        maxLines: 1,
                        maxFontSize: 20,
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'Raleway')),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton (
                          color: globalData.secondaryColor,
                          child: Text('Done?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Raleway')),
                          onPressed: () {
                            confirmDialog(data);
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
          color: globalData.secondaryColor,
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
}
