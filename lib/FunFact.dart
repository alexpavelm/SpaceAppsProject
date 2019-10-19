import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FunFact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(FontAwesomeIcons.infoCircle,
                          color: Colors.lightBlueAccent, size: 30),
                    ),
                    const Expanded(
                        child: Text(
                      "Fun Fact!\nDid you know that public transport reduces polution by 15%?",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ],
                ))));
  }
}
