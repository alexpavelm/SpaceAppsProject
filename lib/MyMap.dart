import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'GlobalData.dart';
import 'LocationData.dart';
import 'PingData.dart';

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
  var globalData = GlobalData();
  MapSampleState(this.data);

  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _kGooglePlex;
  static LatLng _center;
  Set<Marker> _markers = new Set();

  @override
  Widget build(BuildContext context) {
    createCamera();
    createMarkers();
    return new Scaffold(
      body: GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )
    );
  }

  createCamera() {
    _kGooglePlex = CameraPosition(
      target: LatLng(data.pings[0].longitude, data.pings[0].latitude),
      zoom: 11,
    );
  }

  createMarkers() async {
    for (int i = 0; i < data.pings.length; i++) {
      _center = LatLng(data.pings[i].longitude, data.pings[i].latitude);
      _markers.add(
          Marker(
              markerId: MarkerId(data.pings[i].longitude.toString()),
              position: _center,
              infoWindow: InfoWindow(
                title: data.city + "Sensor " + i.toString(),
                snippet: 'Space Apps',
              ),
              icon: getBitmapImage(data.quality))
      );
    };
  }

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



}
