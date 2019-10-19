import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/CurrentLocation.dart';
import 'package:space_apps_project/MyAirTab.dart';
import 'package:space_apps_project/InfoTab.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() {
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    CurrentLocation(),
    MyAirTab(),
    InfoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SafeArea(
            child: new Scaffold(
              body: TabBarView(children: _children), // new
              bottomNavigationBar: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.location_on),
                  ),
                  Tab(
                    icon: Icon(Icons.map),
                  ),
                  Tab(
                    icon: Icon(Icons.info),
                  )
                ],
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
              ),

              ),

            ),
          ),
    );
  }
}
