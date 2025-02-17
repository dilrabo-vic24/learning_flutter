import 'package:location/location.dart';

class GetCurrentLocationService {
  Location location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissonGranted;
  LocationData? _locationData;

  Future<void> enableService() async {
    _serviceEnabled = await location.serviceEnabled();

    if (_serviceEnabled == false) {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled == false) {
        return;
      }
    }
  }

  Future<void> askPermisson() async {
    _permissonGranted = await location.hasPermission();

    if (_permissonGranted == PermissionStatus.denied) {
      _permissonGranted = await location.requestPermission();
      if (_permissonGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<LocationData> getCurrentLocation()async{
    await enableService();
    await askPermisson();

    _locationData = await location.getLocation();
    return _locationData!;
  }
}
