import 'package:flutter/cupertino.dart';
import 'package:space_apps_project/CurrentLocation.dart';

import 'FunFact.dart';
import 'SmallCard.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [
    FunFact(),
    CurrentLocation(),
    SmallCard()
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _children,
    );
  }



}
