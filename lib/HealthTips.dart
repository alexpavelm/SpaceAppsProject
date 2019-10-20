import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.only(top:10, left: 4.0, right: 4),
          child: Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, bottom: 15),
                      child: Text("Health recommendations:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.bus, size: 20),
                          Text("  Avoid exercising near busy roads.",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 17,
                          )),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.campground, size: 18),
                        Text("  Postpone outdoor recreational activities.",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 17
                          )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0, bottom: 7),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.running, size: 20),
                          Text("  Avoid exercising near busy roads.",
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
