import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'get_current_location.dart'; // Joylashuv olish xizmati

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _completer =
      Completer<GoogleMapController>();

  Set<Marker> markers = {};
  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    _setInitialLocation();
  }

  Future<void> _setInitialLocation() async {

    final LocationData currentLocation =
        await GetCurrentLocationService().getCurrentLocation();

    if (currentLocation.latitude == null || currentLocation.longitude == null) {
      // log("error");
      return;
    }

    setState(() {
      currentPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
      markers.add(
        Marker(
          markerId: MarkerId("currentLocation"),
          position: currentPosition!,
          draggable: true,
        ),
      );
    });

    log("Latitude: ${currentLocation.latitude}, Longitude: ${currentLocation.longitude}");

    GoogleMapController googleMapController = await _completer.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentPosition!, zoom: 15),
      ),
    );
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
          target:
              currentPosition ?? LatLng(37.42796133580664, -122.085749655962),
          zoom: 14,
        ),
      ),
    );
  }
}
