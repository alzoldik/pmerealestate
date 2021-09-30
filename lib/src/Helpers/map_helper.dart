import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class MapHelper with ChangeNotifier {
  String address = "انقر لتحديث موقعك";
  bool loading = false;
  var location = Location();
  UserLocation currentLocation = UserLocation();
  getLocation() async {
    if (!await location.serviceEnabled())
      await location.requestService().then((value) {
        print("requestService $value");
        if (value != false) {
          try {
            loading = true;
            currentLocat();
          } catch (e) {
            print("error $e");
            currentLocation = null;
          }
        }
      });
    else {
      try {
        loading = true;
        currentLocat();
      } catch (e) {
        print("error $e");
        currentLocation = null;
      }
    }
  }

  currentLocat() async {
    try {
      var userLocation = await location.getLocation();
      currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    getAddressFromLatLng(currentLocation.latitude, currentLocation.longitude);
    notifyListeners();
  }

  getAddressFromLatLng(double lat, double lng) async {
    String mapApiKey = "AIzaSyBsK-4MOq-CUX55oXI8YMZ8kRGYABzv5_w";
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$_host?key=$mapApiKey&language=en&latlng=$lat,$lng';
    if (lat != null && lng != null) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        String _formattedAddress = data["results"][0]["formatted_address"];
        print("response ==== $_formattedAddress");
        address = _formattedAddress;
        loading = false;
        print("loadint : $loading");
        notifyListeners();
      }
    }
  }
}

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});
}
