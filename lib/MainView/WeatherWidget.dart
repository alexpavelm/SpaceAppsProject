import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/DataObjects/City.dart';

import 'package:space_apps_project/DataObjects/WeatherData.dart';
import 'package:http/http.dart' as http;
import '../GlobalData.dart';
WeatherData weatherData;

class WeatherWidget extends StatefulWidget {
  final City data;

  WeatherWidget(this.data);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> with AutomaticKeepAliveClientMixin{
  final globalData = GlobalData();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if(weatherData == null) {
      loadWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
     child: isLoading ? CircularProgressIndicator() : Container(
       child: Row(
         children: <Widget>[
       CachedNetworkImage(
         imageUrl: 'https://openweathermap.org/img/w/${weatherData.icon}.png',
       placeholder:(context, url) => CircularProgressIndicator(),),
           Text(
             weatherData.temp.floor().toString() + "°C",
             style: TextStyle(
                 fontSize: 23, fontFamily: 'Raleway'),
           ),
         ],
       ),
     ),
     /* child: Container(
          height: 130,
          color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                  child: Text("5-DAY FORECAST", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Sun.", style: TextStyle(fontSize: 15, fontFamily: 'Raleway')),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[0]),
                          ),
                          Text(
                            data.temperature[0].toString() + "°C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Mon.", style: TextStyle(fontSize: 15, fontFamily: 'Raleway')),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[1]),
                          ),
                          Text(
                            data.temperature[1].toString() + "°C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Tue.", style: TextStyle(fontSize: 15, fontFamily: 'Raleway')),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[2]),
                          ),
                          Text(
                            data.temperature[2].toString() + "°C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Wed.", style: TextStyle(fontSize: 15, fontFamily: 'Raleway')),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[3]),
                          ),
                          Text(
                            data.temperature[3].toString() + "°C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Thu.", style: TextStyle(fontSize: 15, fontFamily: 'Raleway')),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, bottom:5),
                            child: globalData.getWeatherIcon(data.weather[4]),
                          ),
                          Text(
                            data.temperature[4].toString() + "°C",
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),*/
    );
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    final lat = widget.data.lat;
    final lon = widget.data.long;
    if(widget.data.weather == null) {
      widget.data.weather = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?APPID=28a50b82164ccaedebaed3d2898215a4&lat=${lat
              .toString()}&lon=${lon.toString()}&units=metric');
      if (widget.data.weather.statusCode == 200) {
        return setState(() {
          weatherData = new WeatherData.fromJson(jsonDecode(widget.data.weather.body));
          isLoading = false;
        });
      }
    }



    setState(() {
      isLoading = false;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
