import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:space_apps_project/DataObjects/City.dart';

import '../../GlobalData.dart';

class MyMap extends StatelessWidget {
  City data;

  MyMap(this.data);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(child: MapSample(data)),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  City data;

  MapSample(this.data);

  @override
  State<MapSample> createState() => MapSampleState(data);
}

class MapSampleState extends State<MapSample> {
  City data;
  var globalData = GlobalData();
  static List<double> lat = new List();
  static List<double> long = new List();
  static List<int> quality = new List();
  static int data_size = 0;
  static int firstTime = 0;

  MapSampleState(this.data);


  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _kGooglePlex;
  static LatLng _center;
  Set<Marker> _markers = new Set();

  @override
  Widget build(BuildContext context) {
    createCamera();
    createMarkers();
    //createMarkers();
    return new Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      markers: _markers,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      gestureRecognizers: Set()
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
        ..add(
          Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer()),
        )
        ..add(
          Factory<HorizontalDragGestureRecognizer>(
              () => HorizontalDragGestureRecognizer()),
        )
        ..add(
          Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
        ),
    ));
  }

  createCamera() {
    _kGooglePlex = CameraPosition(
      target: LatLng(data.lat, data.long),
      zoom: 11,
    );
  }





  /*createMarkers() async {
    for (int i = 0; i < data.pings.length; i++) {
      _center = LatLng(data.pings[i].longitude, data.pings[i].latitude);
      _markers.add(Marker(
          markerId: MarkerId(data.pings[i].longitude.toString()),
          position: _center,
          infoWindow: InfoWindow(
            title: data.name + "Sensor " + i.toString(),
            snippet: 'Space Apps',
          ),
          icon: getBitmapImage(data.pings[i].quality)));
    }
    ;
  }*/

  BitmapDescriptor getBitmapImage(int quality) {
    if (quality < 51) {
      return globalData.greenMarker;
    } else if (quality < 101) {
      return globalData.yellowMarker;
    } else if (quality < 151) {
      return globalData.orangeMarker;
    } else if (quality < 201) {
      return globalData.redMarker;
    } else {
      return globalData.purpleMarker;
    }
  }

  void createMarkers() async {
    for (int i = 0; i < globalData.pings.length; i++) {
      _center = LatLng(globalData.pings[i].longitude, globalData.pings[i].latitude);
      _markers.add(Marker(
          markerId: MarkerId(globalData.pings[i].longitude.toString()),
          position: _center,
          infoWindow: InfoWindow(
            title: data.name + "Sensor " + i.toString(),
            snippet: 'Space Apps',
          ),
          icon: getBitmapImage(globalData.pings[i].quality)));
    }
  }
}
