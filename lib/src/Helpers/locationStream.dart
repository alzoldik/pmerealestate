// import 'dart:async';

// import 'package:location/location.dart';

// class LocationService {
//   // Keep track of current Location
//   UserLocation _currentLocation;
//   Location location = Location();
//   // Continuously emit location updates
//   StreamController<UserLocation> _locationController =
//       StreamController<UserLocation>.broadcast();

//   LocationService() {
//     location.requestPermission().then((granted) {
//       if (granted == PermissionStatus.GRANTED) {
//         location.onLocationChanged().listen((locationData) {
//           if (locationData != null) {
//             print("stream location ${locationData.latitude}");
//             _locationController.add(UserLocation(
//               latitude: locationData.latitude,
//               longitude: locationData.longitude,
//             ));
//           }
//         });
//       }
//     });
//   }

//   Stream<UserLocation> get locationStream => _locationController.stream;

//   Future<UserLocation> getLocation() async {
//     try {
//       var userLocation = await location.getLocation();
//       _currentLocation = UserLocation(
//         latitude: userLocation.latitude,
//         longitude: userLocation.longitude,
//       );
//     } catch (e) {
//       print('Could not get the location: $e');
//     }

//     return _currentLocation;
//   }
// }

// class UserLocation {
//   final double latitude;
//   final double longitude;

//   UserLocation({this.latitude, this.longitude});
// }
