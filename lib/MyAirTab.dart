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
    return Center(
      child: Text('My Air Tab')
    );
  }
}