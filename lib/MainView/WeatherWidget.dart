import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_apps_project/DataObjects/City.dart';

import 'package:space_apps_project/DataObjects/WeatherData.dart';
import 'package:http/http.dart' as http;
import '../GlobalData.dart';

class WeatherWidget extends StatefulWidget {
  final City data;

  WeatherWidget(this.data);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget>
    with AutomaticKeepAliveClientMixin {
  final globalData = GlobalData();
  bool isLoading = false;
  WeatherData weatherData;

  @override
  void initState() {
    super.initState();
    if (weatherData == null) {
      loadWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: isLoading
          ? CircularProgressIndicator()
          : Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5, right: 10),
                    child: globalData.getWeatherIcon(weatherData.icon),
                  ),
                  Text(
                    weatherData.temp.floor().toString() + "°C",
                    style: TextStyle(fontSize: 23, fontFamily: 'Raleway'),
                  ),
                ],
              ),
            ),
    );
  }

  /*
  * Get real time weather
  *  - API USED : api.openweathermap.org
  * */
  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    final lat = widget.data.lat;
    final lon = widget.data.long;
    if (widget.data.weather == null) {
      widget.data.weather = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?APPID=28a50b82164ccaedebaed3d2898215a4&lat=${lat.toString()}&lon=${lon.toString()}&units=metric');
      if (widget.data.weather.statusCode == 200) {
        return setState(() {
          weatherData =
              new WeatherData.fromJson(jsonDecode(widget.data.weather.body));
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
