import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_forward_ios,
                          color: Colors.lightBlueAccent, size: 30),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Fun fact!",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.lightBlueAccent,
                              fontFamily: 'Raleway'),
                          maxLines: 3,
                        ),
                        Text(
                          "Did you know that public transport reduces polution by 15%?",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                          ),
                          maxLines: 3,
                        )
                      ],
                    )
                  ],
                ))));
  }
}
