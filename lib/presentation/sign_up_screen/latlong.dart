import 'package:bdc/presentation/donor_detail_screen/donor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'dart:async';

class LatLong extends StatefulWidget {
  const LatLong({super.key});

  @override
  State<LatLong> createState() => _LatLongState();
}

class _LatLongState extends State<LatLong> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(28, 84),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(children: [
        Container(
          child: GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 1,
                target: LatLng(28, 84),
              ),
              markers: Set<Marker>.of(_markers),
              myLocationEnabled: true,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(340.0, 580, 5, 20),
          child: FloatingActionButton(
            onPressed: () async {
              getUserCurrentLocation().then((value) async {
                print(value.latitude.toString() +
                    " " +
                    value.longitude.toString());

                // marker added for current users location
                _markers.add(Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location',
                  ),
                ));

                // specified current users location
                CameraPosition cameraPosition = new CameraPosition(
                  target: LatLng(value.latitude, value.longitude),
                  zoom: 17,
                );

                controller1.text = value.latitude.toString();

                controller2.text = value.longitude.toString();

                final GoogleMapController controller = await _controller.future;

                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
            child: Icon(Icons.my_location),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(345.0, 670, 5, 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DonorDetailScreen(
                          latitude: controller1.text,
                          longitude: controller2.text)));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(11)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('OK', style: TextStyle(color: Colors.white)),
                )),
          ),
        )
      ]),
    );
  }
}
