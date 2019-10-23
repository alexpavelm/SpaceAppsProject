import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class City {

  final String name;
  final String country;
  final int aqi;
 // final bool isProvided;
  final double lat;
  final double long;
  final String provider;
  final DocumentReference reference;


  City.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['country'] != null),
        assert(map['aqi'] != null),
       // assert(map['isProvided'] != null),
        assert(map['lat'] != null),
        assert(map['long'] != null),
        assert(map['provider'] != null),
        name = map['name'],
        country = map['country'],
        aqi = map['aqi'],
       // isProvided = map['isProvided'],
        lat = map['lat'],
        long = map['long'],
        provider = map['provider'];

  City.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}