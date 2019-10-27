import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:space_apps_project/DataObjects/FunFact.dart';

import '../GlobalData.dart';

class FunFactWidget extends StatelessWidget {
  FunFact data;
  var globalData = GlobalData();

  FunFactWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // When  pressed is opened a link with more info about the fact
      onTap: () => globalData.launchURL(data.link),

      child: Padding(
        padding:
            // Constraints
            const EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
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
                          "Fun Fact!",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: globalData.mainColor),
                        ),
                        Text(
                          data.text,
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
    );
  }
}
