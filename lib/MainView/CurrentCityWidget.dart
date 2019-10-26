import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:space_apps_project/DataObjects/City.dart';

import 'package:space_apps_project/MainView/ExpandedCityView/ExpandedCardView.dart';
import '../GlobalData.dart';
import '../user_location.dart';
import 'ExpandedCityView/5DaysForecast.dart';

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
  void initState() {
    super.initState();
    if(globalData.isGPS){
      getLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        Days5Forecast(globalData.mainCity)
                      ],
                    ),
                  ),
                ),
              ));
        } else {
          return Padding(
            padding: const EdgeInsets.only(top:10, left: 2.0, right: 2),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: <Widget>[
                    Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4),
                          child: Icon(Icons.location_on,
                          size: 30,
                          color: globalData.secondaryColor),
                        ),
                        Container(
                            width: 210,
                            child: Text("Allow AirApp to access current location with GPS?",
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 15,
                              ),
                              maxLines: 3,
                            ),
                        ),
                        FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            color: globalData.secondaryColor,
                            child: Text( "Allow",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,

                                )),
                          onPressed: () {
                            setState(() {
                              globalData.isGPS = true;
                              globalData.cityAssigned =
                                  Future.delayed(new Duration(microseconds: 1));
                              getLocation();
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );


          /*Padding(
            padding: const EdgeInsets.only(top:10.0, left: 20, right: 20),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10),
              ),
              color: globalData.mainColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" Agree",
                      style: TextStyle(
                          fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
                ],
              ),
              onPressed: () {
                setState(() {
                  globalData.isGPS = true;
                  globalData.cityAssigned =
                      Future.delayed(new Duration(microseconds: 1));
                  getLocation();
                });
              },
            ),
          );*/
        }
      }
    );
  }
  getLocation() async {
    var lat, long;
    var globalData = GlobalData();
    Location location = Location();
    if(globalData.userLocation == null) {
      location.requestPermission().then((granted) {

        if (granted) {
          location.onLocationChanged().listen((locationData) async{
            if (locationData != null && globalData.userLocation == null) {
              List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(locationData.latitude, locationData.longitude, localeIdentifier: 'en_UK'.toString());
              globalData.userLocation = UserLocation(
                latitude: lat,
                longitude: long,
                cityName: placemark[0].locality,
              );
              if(globalData.mainCity == null) {
                globalData.mainCity =  City.fromSnapshot(globalData.cityList.firstWhere((city)
                => city.data["name"].toString().contains(globalData.userLocation.cityName)));
              }
              currentLocation = Future.delayed(new Duration(microseconds: 1));
              setState(() {

              });
            }
          });
        }
      });
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
