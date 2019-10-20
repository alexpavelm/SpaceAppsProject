import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return FutureBuilder(
      future: globalData.cityAssiged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _children,
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "You don't have a selected city",
                  style: TextStyle(fontFamily: 'Raleway', fontSize: 20),
                ),
              ),
              gpsButton(),
              listButton()
            ],
          );
        }
      },
    );
  }

  Widget listButton() {
    return FlatButton(
      color: Colors.blue.shade200,
      child: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.list),
            Text("Get location from list",
                style: TextStyle(
                    fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      onPressed: () {
        showListOfCities();
      },
    );
  }

  Widget gpsButton() {
    return FlatButton(
      color: Colors.blue.shade200,
      child: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.gps_fixed),
            Text("Get location with GPS",
                style: TextStyle(
                    fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      onPressed: () {
        setState(() {
          globalData.mainCity = globalData.cityList[10];

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }),
          );
          Future.delayed(new Duration(seconds: 2), (() {
            globalData.cityAssiged =
                Future.delayed(new Duration(microseconds: 1));
            return Navigator.of(context).pop();

          }));
        });
      },
    );
  }

  Future showListOfCities() {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            child: AlertDialog(
              title: Text("Select a city"),
              content: SizedBox(
                width: MediaQuery.of(context).size.height * 0.8,
                height: MediaQuery.of(context).size.width * 0.7,
                child: ListView.separated(
                  itemCount: globalData.cityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          globalData.mainCity = globalData.cityList[index];
                          globalData.cityAssiged =
                              Future.delayed(new Duration(microseconds: 1));
                          Navigator.of(context).pop();
                        });
                      },
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Text(globalData.cityList[index].city + ", "),
                            Text(
                              globalData.cityList[index].country,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: Colors.black);
                  },
                ),
              ),
            ),
          );
        });
  }
}
