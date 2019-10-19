import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentLocation extends StatefulWidget {
  @override
  State<CurrentLocation> createState() {
    return CurrentLocationState();
  }
}

class CurrentLocationState extends State<CurrentLocation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 300,
                width: 400,
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Row(
                        children: <Widget>[
                                Text(
                                  "Constanta",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      fontFamily: 'Raleway'),
                                ),
//                              Text(
//                                "buna ziua",
//                                textAlign: TextAlign.right,
//                                style: TextStyle(
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 30,
//                                    fontFamily: 'Raleway'),
//                              ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FittedBox(
                                  child: Text("hello"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "current city",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
