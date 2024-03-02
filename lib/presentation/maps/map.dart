import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class DonorsNearby extends StatefulWidget {
  const DonorsNearby({super.key});

  @override
  State<DonorsNearby> createState() => _DonorsNearbyState();
}

class _DonorsNearbyState extends State<DonorsNearby> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = [];

  Future<List<Map<String, dynamic>>> fetchUserLocations() async {
    // Replace 'your_backend_api_endpoint' with your actual backend API endpoint
    var url = Uri.parse('http://192.168.1.7:4444/bloodcare/donors/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print("${response.body}");
      List<Map<String, dynamic>> userLocations = [];
      for (var userData in data) {
        // Extract latitude and longitude from user data
        double latitude = double.parse(userData['latitude']);
        double longitude = double.parse(userData['longitude']);
        print('LATITUDE:${userData['latitude']}');
        userLocations.add({
          'latitude': latitude,
          'longitude': longitude,
        });
      }
      return userLocations;
    } else {
      throw Exception('Failed to fetch user locations');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserLocations().then((userLocations) {
      setState(() {
        _markers = userLocations.map((location) {
          return Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

            markerId: MarkerId(location['latitude'].toString() +
                location['longitude'].toString()),
            position: LatLng(location['latitude'], location['longitude']),
            infoWindow: InfoWindow(
              title: 'User Location',
            ),
          );
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donors Nearby', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[800],
      ),
      body: Stack(children: [
        Container(
          child: GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 15,
                target: LatLng(27.712020, 85.300140),
              ),
              markers: Set<Marker>.of(_markers),
              myLocationEnabled: true,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }),
        ),
      ]),
    );
  }
}
