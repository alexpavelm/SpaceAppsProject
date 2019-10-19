import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LocationData.dart';

class ExpandedCardView extends StatelessWidget {
  final LocationData data;
  ExpandedCardView(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        iconTheme: IconThemeData(
        color: Colors.grey, //change your color here
    ),
    title: Text(
    data.city,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    ),
    body: Container(),
    );
  }
}
