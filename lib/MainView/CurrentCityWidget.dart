import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:space_apps_project/DataObjects/City.dart';

import 'package:space_apps_project/MainView/ExpandedCityView/ExpandedCardView.dart';
import '../GlobalData.dart';

var currentLocation;


class CurrentCityWidget extends StatefulWidget {
  @override
  State<CurrentCityWidget> createState() {
    return CurrentCityWidgetState();
  }
}

class CurrentCityWidgetState extends State<CurrentCityWidget> {
  var globalData = GlobalData();

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    return FutureBuilder(
      future: currentLocation,
      builder: (_, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpandedCardView(globalData.mainCity)),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(globalData.mainCity.name,
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 3,
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  InkWell(
                                      onTap: () => showListOfCities(),
                                      child: Icon(Icons.settings,
                                          color: Colors.black.withOpacity(0.6)))
                                ],
                              ),
                              Text(
                                globalData.mainCity.country,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  printCurrentDate(),
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontFamily: 'Raleway', fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                                color:
                                globalData.getCardColor(globalData.mainCity.aqi),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(
                                            globalData.getQualityIcon(
                                                globalData.mainCity.aqi),
                                            size: 60,
                                            color: Colors.black.withOpacity(0.6),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 4, right: 4),
                                            child: Text(
                                              globalData.getQualityText(
                                                  globalData.mainCity.aqi),
                                              style: TextStyle(
                                                  fontFamily: 'Raleway',
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black.withOpacity(0.6)),
                                            ),
                                          ),
                                          Row(children: <Widget>[
                                            Text(
                                              "AQI: ",
                                              style: TextStyle(
                                                fontFamily: 'Raleway',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              globalData.mainCity.aqi.toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Raleway',
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black.withOpacity(0.6)),
                                            ),
                                          ])
                                        ])))),
                        //WeatherWidget(globalData.mainCity.weatherData)
                      ],
                    ),
                  ),
                ),
              ));
        } else {
          return Container(
            child: Text("nu ai selectat oras"),
          );
        }
      }
    );
  }

  Future getCurrentLocation() async {
    var location = new Location();

// Platform messages may fail, so we use a try/catch PlatformException.
    try {
      currentLocation = await location.getLocation();
    } on Exception catch (e) {
      currentLocation = null;
      print(e);
    }
  }

  Widget buildWeather(String data) {
    return Text(data);
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

  String printCurrentDate() {
    var now = DateTime.now();
    String date = "";
    switch (now.weekday) {
      case 1:
        date += "Monday, ";
        break;
      case 2:
        date += "Tuesday, ";
        break;
      case 3:
        date += "Wednesday, ";
        break;
      case 4:
        date += "Thursday, ";
        break;
      case 5:
        date += "Friday, ";
        break;
      case 6:
        date += "Saturday, ";
        break;
      case 7:
        date += "Sunday, ";
        break;
      default:
        date += "error";
        break;
    }
    date += now.day.toString() + " ";
    switch (now.month) {
      case 1:
        date += "Jan ";
        break;
      case 2:
        date += "Feb ";
        break;
      case 3:
        date += "Mar ";
        break;
      case 4:
        date += "Apr ";
        break;
      case 5:
        date += "May ";
        break;
      case 6:
        date += "Jun ";
        break;
      case 7:
        date += "Jul ";
        break;
      case 8:
        date += "Aug ";
        break;
      case 9:
        date += "Sep ";
        break;
      case 10:
        date += "October ";
        break;
      case 11:
        date += "Nov";
        break;
      case 12:
        date += "Dec ";
        break;
      default:
        date += "error";
        break;
    }
    return date + now.year.toString();
  }
}
