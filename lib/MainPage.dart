import 'package:flutter/cupertino.dart';
import 'package:space_apps_project/CurrentLocation.dart';

import 'FunFact.dart';
import 'GlobalData.dart';
import 'SmallCard.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static var globalData = GlobalData();
  final List<Widget> _children = [
    CurrentLocation(),
    FunFact(globalData.getFunFact()),

    SmallCard()
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _children,
    );
  }



}
