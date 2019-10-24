import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BottomNavBar.dart';
import 'GlobalData.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
  var globalData = GlobalData();
  globalData.create();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Ceva");
    return MaterialApp(
      title: 'Space Apps Project',
      theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.lightBlue),
      home: BottomNavBar(),
    );
  }
}
