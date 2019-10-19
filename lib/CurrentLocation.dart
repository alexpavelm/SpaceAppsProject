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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Constanta",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: 'Railway'),
                          ),
                          Text(
                            "current city",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Railway',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FittedBox(
                            child: Text(
                              "hello"
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
