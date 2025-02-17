import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_lesson/get_current_location.dart';
import 'package:location/location.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _completer =
      Completer<GoogleMapController>();

  Set<Marker> markers = {
    Marker(
        draggable: true,
        markerId: MarkerId("markerid1"),
        icon: AssetMapBitmap(
          "assets/markers/marker.jpg",
          height: 50,
          width: 50,
        ),
        position: LatLng(37.42796133580664, -122.085749655962)),
  };

  Future<void> goToSurkhandarya() async {
    final LocationData currentLocation =
        await GetCurrentLocationService().getCurrentLocation();

    var position =
        LatLng(currentLocation.latitude!, currentLocation.longitude!);

    markers.add(
      Marker(
        onDrag: (value) async {
          GoogleMapController googleMapController = await _completer.future;

          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: position),
            ),
          );

          setState(() {
            position = value;
          });
        },
        draggable: true,
        markerId: MarkerId("currentLocation"),
        icon: AssetMapBitmap("assets/markers/marker.jpg"),
        position: position,
      ),
    );

    log(currentLocation.latitude.toString());
    log(currentLocation.longitude.toString());

    GoogleMapController googleMapController = await _completer.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          ),
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          _completer.complete(controller);
        },
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          await goToSurkhandarya();
        },
        child: Icon(
          Icons.location_searching_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
