// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_lesson/constants.dart';

// class DrawPolyline extends StatefulWidget {
//   const DrawPolyline({super.key});

//   @override
//   State<DrawPolyline> createState() => _DrawPolylineState();
// }

// class _DrawPolylineState extends State<DrawPolyline> {
//   LatLng origin = const LatLng(55.751244, 37.618423);
//   LatLng destination = const LatLng(34.498512, 69.140167);

//   Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];
//   Map<MarkerId, Marker> markers = {};
//   PolylinePoints polylinePoints = PolylinePoints();
//   late GoogleMapController mapController;
//   @override
//   void initState() {
//     super.initState();
//     _addMarker(
//       origin,
//       "id",
//       BitmapDescriptor.defaultMarker,
//     );
//     _addMarker(destination, "destination", BitmapDescriptor.defaultMarker);

//     _getPolyline();
//   }

//   void _onMapCreated(GoogleMapController controller) async {
//     mapController = controller;
//   }

//   _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
//     MarkerId markerId = MarkerId(id);
//     Marker marker =
//         Marker(markerId: markerId, icon: descriptor, position: position);
//     markers[markerId] = marker;
//   }

//   _addPolyLine() {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id, color: Colors.red, points: polylineCoordinates);
//     polylines[id] = polyline;
//     setState(() {});
//   }

//   _getPolyline() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       googleApiKey: googleMapsApiKey,
//       request: PolylineRequest(
//         origin: PointLatLng(origin.latitude, origin.longitude),
//         destination: PointLatLng(
//           destination.latitude,
//           destination.longitude,
//         ),
//         mode: TravelMode.walking,
//         wayPoints: [PolylineWayPoint(location: "Qarshi")],
//       ),
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }
//     _addPolyLine();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       onMapCreated: (controller) => _onMapCreated(controller),
//       polylines: Set<Polyline>.of(polylines.values),
//       markers: {
//         Marker(
//           infoWindow: InfoWindow(
//             title: "Dilrabo darsga qarang",
//             snippet: "Sanobar keyingisida siz",
//           ),
//           markerId: const MarkerId("origin"),
//           position: origin,
//         ),
//         Marker(
//           infoWindow: InfoWindow(title: "Kabul, Sanobar"),
//           markerId: const MarkerId("destination"),
//           position: destination,
//         ),
//       },
//       initialCameraPosition: CameraPosition(
//         target: origin,
//         zoom: 10,
//       ),
//     );
//   }
// }