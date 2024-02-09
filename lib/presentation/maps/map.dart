import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'dart:async';

class DonorsNearby extends StatefulWidget {
  const DonorsNearby({super.key});

  @override
  State<DonorsNearby> createState() => _DonorsNearbyState();
}

class _DonorsNearbyState extends State<DonorsNearby> {
  Completer<GoogleMapController> _controller = Completer();
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donors Nearby'),
        backgroundColor: Colors.red[800],
      ),
      body: Stack(
        children: [Container(
          child: GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 17.4746,
                target: LatLng(
                    27.712020, 85.300140),
              ),
              markers: Set<Marker>.of(_markers),


              myLocationEnabled: true,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }),

        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(340.0,580,5,20),
          child:  FloatingActionButton(
            onPressed: () async{
              getUserCurrentLocation().then((value) async {
                print(value.latitude.toString() +" "+value.longitude.toString());

                // marker added for current users location
                _markers.add(
                    Marker(
                      markerId: MarkerId("2"),
                      position: LatLng(value.latitude, value.longitude),
                      infoWindow: InfoWindow(
                        title: 'My Current Location',
                      ),
                    )
                );

                // specified current users location
                CameraPosition cameraPosition = new CameraPosition(
                  target: LatLng(value.latitude, value.longitude),
                  zoom: 17,
              git version  );

                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {
                });
              });
            },
            child: Icon(Icons.my_location),
          ),

        )]
      ),
      
    );
  }
}
