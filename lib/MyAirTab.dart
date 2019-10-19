import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyAirTab extends StatefulWidget {
  @override
  State<MyAirTab> createState() {
    return MyAirTabState();
  }
}

class MyAirTabState extends State<MyAirTab> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white, //Changing this will change the color of the TabBar
        accentColor: Colors.lightBlue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar (
              indicatorColor: Colors.lightBlue,
              tabs: [
                Tab(
                  text: "Current"
                ),
                Tab(
                  text: "Other"
                ),
              ],
            ),
          ),
        )
      )
    );
  }

}