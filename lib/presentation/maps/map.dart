// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DonorsNearby extends StatefulWidget {
  const DonorsNearby({Key? key}) : super(key: key);

  @override
  _DonorsNearbyState createState() => _DonorsNearbyState();
}

class _DonorsNearbyState extends State<DonorsNearby> {
  TextEditingController _bloodGroupController = TextEditingController();

  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = [];
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<List<Map<String, dynamic>>> fetchUserLocations() async {
    String? accessToken = await secureStorage.read(key: 'access_token');
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    var url = 'http://192.168.1.4:4444/bloodcare/donors/';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> userLocations = [];
      for (var userData in data) {
        double latitude = double.parse(userData['lattitude']);
        double longitude = double.parse(userData['longitude']);
        userLocations.add({
          'latitude': latitude,
          'longitude': longitude,
          'name': userData['name'],
          'bloodgrp': userData['bloodgrp'],
          'gender': userData['gender'],
          'dob': userData['dob'],
          'phoneno': userData['phoneno'],
          'prov_no': userData['prov_no'],
          'city': userData['city'],
          'district': userData['district']
        });
      }
      return userLocations;
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> searchUserLocations(
      String bloodGroup) async {
    String? accessToken = await secureStorage.read(key: 'access_token');
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    var url = 'http://192.168.1.4:4444/bloodcare/donors/?search=$bloodGroup';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print('${data}');
      List<Map<String, dynamic>> userLocations = [];
      for (var userData in data) {
        double latitude = double.parse(userData['lattitude']);
        double longitude = double.parse(userData['longitude']);
        userLocations.add({
          'latitude': latitude,
          'longitude': longitude,
          'name': userData['name'],
          'bloodgrp': userData['bloodgrp'],
          'gender': userData['gender'],
          'dob': userData['dob'],
          'phoneno': userData['phoneno'],
          'prov_no': userData['prov_no'],
          'city': userData['city'],
          'district': userData['district']
        });
      }
      return userLocations;
    } else {
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserLocations().then((userLocations) {
      if (userLocations.isNotEmpty) {
        setState(() {
          _markers = userLocations.map((location) {
            return Marker(
              markerId: MarkerId(location['name']),
              position: LatLng(location['latitude'], location['longitude']),
              infoWindow: InfoWindow(
                title: location['name'],
                snippet: location['bloodgrp'],
              ),
              onTap: () {
                _showDonorDetailsBottomSheet(context, location);
              },
            );
          }).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donors Nearby', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[800],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(27.712020, 85.300140),
              zoom: 12,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: Set<Marker>.of(_markers),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: 21,
            left: 16.0,
            right: 16.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _bloodGroupController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter blood group (e.g., A+)',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String bloodGroup = _bloodGroupController.text.trim();
                      if (bloodGroup.isNotEmpty) {
                        searchUserLocations(bloodGroup).then((userLocations) {
                          if (userLocations.isNotEmpty) {
                            setState(() {
                              _markers = userLocations.map((location) {
                                return Marker(
                                  markerId: MarkerId(location['name']),
                                  position: LatLng(location['latitude'],
                                      location['longitude']),
                                  infoWindow: InfoWindow(
                                    title: location['name'],
                                    snippet: location['bloodgrp'],
                                  ),
                                  onTap: () {
                                    _showDonorDetailsBottomSheet(
                                        context, location);
                                  },
                                );
                              }).toList();
                            });
                          } else {
                            // Show a dialog or handle no search results found
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('No Search Results'),
                                  content: Text(
                                      'No donors found for the given blood group.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDonorDetailsBottomSheet(
      BuildContext context, Map<String, dynamic> donorDetails) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                donorDetails['name'] ?? 'Donor Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text("Blood Group: ${donorDetails['bloodgrp']}"),
              SizedBox(height: 10),
              Text("Gender: ${donorDetails['gender']}"),
              SizedBox(height: 10),
              Text(
                  "Location: ${donorDetails['latitude']}, ${donorDetails['longitude']}"),
              SizedBox(height: 10),
              Text("Phone No.: ${donorDetails['phoneno']}"),
              SizedBox(height: 10),
              Text("DOB: ${donorDetails['dob']}"),
              SizedBox(height: 10),
              Text("Province no.: ${donorDetails['prov_no']}"),
              SizedBox(height: 10),
              Text("City: ${donorDetails['city']}"),
              SizedBox(height: 10),
              Text("District: ${donorDetails['district']}"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _launchDialer(donorDetails['phoneno']);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Contact',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Confirm',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future _launchDialer(String phoneNumber) async {
    print('$phoneNumber');
    print('launch fxn called');
    Uri phoneno = Uri.parse('tel:+977$phoneNumber');
    if (await launchUrl(phoneno)) {
      print('dialeropened');
    } else {
      print('dialernotopened');

      //dailer is not opened
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirmation',
            style: TextStyle(color: Colors.red[800]),
          ),
          content: Text(
              'Are you sure you want to confirm? Please make sure you have contacted the donor before confirming.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your logic here to handle confirmation
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
