import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        infoCard('What is air quality?',
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
        infoCard('What is air quality?',
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
        infoCard('What is air quality?',
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
      ],
    ));
  }

  Widget infoCard(String title, String text) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: <Widget>[
                  Text(title,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                      )),
                  new Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        height: 0.5,
                        color: Colors.grey,
                      )),
                  Text(text,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18, fontFamily: 'Raleway'))
                ]))));
  }
}
