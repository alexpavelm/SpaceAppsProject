import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/DataObjects/City.dart';
import 'package:space_apps_project/MainView/CurrentCityWidget.dart';

import 'package:space_apps_project/MainView/FunFactWidget.dart';
import '../GlobalData.dart';
import 'CitiesView.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  static var globalData = GlobalData();
  final List<Widget> _children = [
    //CurrentCityWidget(),
    FunFactWidget(globalData.getFunFact()),
    CitiesView()
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: globalData.cityAssigned,
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
              laterButton()
            ],
          );
        }
      },
    );
  }

  Widget laterButton() {
    return FlatButton(
      color: Colors.blue.shade200,
      child: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.watch_later),
            Text("I'll select it later",
                style: TextStyle(
                    fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      onPressed: () {
        setState(() {
          //globalData.mainCity = City.fromSnapshot(globalData.cityList[10]);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }),
          );
            globalData.cityAssigned =
                Future.delayed(new Duration(microseconds: 1));
            Navigator.of(context).pop();
        });
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
          //globalData.mainCity = City.fromSnapshot(globalData.cityList[10]);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }),
          );
          Future.delayed(new Duration(seconds: 2), (() {
            globalData.cityAssigned =
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
                          globalData.mainCity = City.fromSnapshot(globalData.cityList[index]);
                          globalData.cityAssigned =
                              Future.delayed(new Duration(microseconds: 1));
                          Navigator.of(context).pop();
                        });
                      },
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Text(City.fromSnapshot(globalData.cityList[index]).name + ", "),
                            Text(
                              City.fromSnapshot(globalData.cityList[index]).country,
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
