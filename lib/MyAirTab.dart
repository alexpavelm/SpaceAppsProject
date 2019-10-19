import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'String_res.dart';

class MyAirTab extends StatefulWidget {
  @override
  State<MyAirTab> createState() {
    return MyAirTabState();
  }
}

class MyAirTabState extends State<MyAirTab> {
//  static const String ceva = "ceva";
  String_res resources = String_res();
  int nQuests = 3;
  bool box = false;

  bool checkboxValueC;
  int radioValue = 0;
  bool switchValue = false;

  get titles => null;


  @override
  Widget build(BuildContext context) {

    //final titles = ['Go for a walk', 'Go to job by bicycle', 'Plant a flower'];
    List<String> titles = ['Go for a walk', 'Go to job by bicycle', 'Plant a flower'];
    final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card( //                           <-- Card widget
          child: ListTile(
            trailing: FlatButton.icon(
                          color: Colors.red,
                          icon: Icon(Icons.sentiment_very_satisfied),

                          //`Icon` to display
                          label: Text('Done it ?'),
                          //`Text` to display
                          onPressed: () {
                            setState(() {

                            });
                            //Code to execute when Floating Action Button is clicked
                            //...
                          }),
            //: Icon(icons[index]),
            title: Text(titles[index]),
          ),
        );
      },
    );
  }

}


//Widget quest(String text) {
//  return Padding(
//    padding: const EdgeInsets.all(2.0),
//    child: Container(
//      height: 100,
//      child: Card(
//        color: Color.fromRGBO(230, 126, 34, 1),
//        clipBehavior: Clip.antiAlias,
//        child: ListView(
//
//          children: <Widget>[
//
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.only(left: 16, right: 8, bottom:20.0, top: 29 ),
//                child: Column(
//                    children: <Widget>[
//                      new Text(
//                          text,
//                          textAlign: TextAlign.left,
//                          style: TextStyle(fontSize: 15, fontFamily: 'Raleway'),
//
//                          ),
//
//                    ],
//                  ),
//              ),
//            ),
//            Column(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 29.0, left: 2),
//                  child: Column(
//                    children: <Widget>[
//                      FlatButton.icon(
//                          color: Colors.red,
//                          icon: Icon(Icons.sentiment_very_satisfied),
//
//                          //`Icon` to display
//                          label: Text('Done it ?'),
//                          //`Text` to display
//                          onPressed: () {
//
//                            //Code to execute when Floating Action Button is clicked
//                            //...
//                          })
//                    ],
//                  ),
//                ),
//              ],
//            )
//          ],
//        ),
//      ),
//    ),
//  );
//}
