import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:space_apps_project/user_location.dart';

class LocationService {
  // Keep track of current Location
  Location location = Location();
  // Continuously emit location updates
  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted) {
          location.onLocationChanged().listen((locationData) async{
          if (locationData != null) {
            List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(locationData.latitude, locationData.longitude, localeIdentifier: 'en_UK'.toString());
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
              cityName: placemark[0].locality,
            ));
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;
}
