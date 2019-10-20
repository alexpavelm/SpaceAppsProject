import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoTab extends StatefulWidget {
  @override
  State<InfoTab> createState() {
    return InfoTabState();
  }
}

class InfoTabState extends State<InfoTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: <Widget>[
        infoCard(FontAwesomeIcons.wind,
            '  What is air quality?',
            "“Air quality” refers to the condition of the air within our surrounding. Good air quality pertains to the degree which the air is clean, clear and free from pollutants such as smoke, dust and smog among other gaseous impurities in the air. Air quality is determined by assessing a variety of pollution indicators. Good air quality is a requirement for preserving the exquisite balance of life on earth for humans, plants, animals and natural resources. As such, human health, plants, animals and natural resources are threatened when pollution in the air reach high concentrations."),
        infoCard(Icons.data_usage,
            '  How is it degraded?',
          "Air quality is degraded by the day to day emissions from different air pollution sources. These include: stationary sources such as power plants, manufacturing facilities, smelters, motor machines, and burning wood and coal; mobile sources such as trucks, buses, planes and cars; and natural sources such as volcanic eruptions, and windstorm dust. The pollutants from these sources are released into the air which can affect the health of humans, animals and our environment. The quality of air depends on 3 factors: the amount of pollutants, the rate at which they are released in the atmosphere, and how long they are trapped in an area."),
          infoCard(Icons.equalizer,
            ' AQI and how it works',
          "Think of the AQI as a yardstick that runs from 0 to 500. The higher the AQI value, the greater the level of air pollution and the greater the health concern. For example, an AQI value of 50 represents good air quality with little potential to affect public health, while an AQI value over 300 represents hazardous air quality. \n\nAn AQI value of 100 generally corresponds to the national air quality standard for the pollutant, which is the level EPA has set to protect public health. AQI values below 100 are generally thought of as satisfactory. When AQI values are above 100, air quality is considered to be unhealthy-at first for certain sensitive groups of people, then for everyone as AQI values get higher.",),
        Image.asset('assets/airquality.jpg'),
        infoCard(FontAwesomeIcons.chartLine,
            '  Accuracy of AQI',
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
      ],
    ));
  }

  Widget infoCard(IconData icon, String title, String text) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(icon,
                      size: 20),
                      Text(title,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Raleway',
                          )),
                    ],
                  ),
                  new Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        width: 270,
                        height: 0.9,
                        color: Colors.lightBlueAccent,
                      )),
                  Text(text,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18, fontFamily: 'Raleway'))
                ]))));
  }
}
