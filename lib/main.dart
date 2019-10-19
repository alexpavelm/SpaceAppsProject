import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BottomNavBar.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white, //Changing this will change the color of the TabBar
        accentColor: Colors.lightBlue
      ),
      home: BottomNavBar(),
    );
  }
}