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
      padding: const EdgeInsets.all(8.0),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Constanta",
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        "current city",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15),
                      ),
                      Row(
                        children: [
                          Container(
//                          child: Icon(Icons.c)
                              )
                        ],
                      ),
                    ],
                  )

//                Text(
//                  "Constanta",
//                  textAlign: TextAlign.left,
//                  style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 30),
//                ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
