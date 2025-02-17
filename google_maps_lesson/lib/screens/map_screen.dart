import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? currentPosition;
  MapType currentMapType = MapType.normal;
  BitmapDescriptor? customMarkerIcon;

  Future<void> getCurrentLocation()async{
    LatLng position = LocationService
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}