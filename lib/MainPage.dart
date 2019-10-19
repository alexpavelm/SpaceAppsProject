import 'package:flutter/cupertino.dart';
import 'package:space_apps_project/CurrentLocation.dart';

import 'FunFact.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [
    FunFact(),
    CurrentLocation(),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _children,
    );
  }

  List<Widget> getList() {
    _children.addAll([]);
    return _children;
  }



}
