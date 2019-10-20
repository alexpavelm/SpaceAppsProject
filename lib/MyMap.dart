import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'LocationData.dart';

class MyMap extends StatelessWidget {
  LocationData data;

  MyMap(this.data);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 350,
      child: MapSample(data),
    );
  }
}

class MapSample extends StatefulWidget {
  LocationData data;

  MapSample(this.data);

  @override
  State<MapSample> createState() => MapSampleState(data);
}

class MapSampleState extends State<MapSample> {
  LocationData data;

  MapSampleState(this.data);

  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _kGooglePlex;

  static CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static LatLng _center;

  static MarkerId markerId = MarkerId("1");

  Set<Marker> _markers;

  @override
  Widget build(BuildContext context) {
    createCamera();
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _markers,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  createCamera() {
    _kGooglePlex = CameraPosition(
      target: LatLng(data.pings[0].longitude, data.pings[0].latitude),
      zoom: 11,
    );
    _center = LatLng(data.pings[0].longitude, data.pings[0].latitude);
    _markers = new Set();
    _markers.add(
      Marker(
          markerId: markerId,
          position: _center,
          infoWindow: InfoWindow(
            title: 'Custom Marker',
            snippet: 'Inducesmile.com',
          ),)
    );
  }
}
