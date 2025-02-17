import 'package:location/location.dart';

class LocationService {
  final Location location = Location();
  bool? _isServiceEnabled;
  PermissionStatus? permissionStatus;
  LocationData? locationData;

  LocationService(){
    initServiceEnabled();
    initLocationPermission();
  }

  Future<void>  initServiceEnabled() async{
    _isServiceEnabled = await location.serviceEnabled();

    if(_isServiceEnabled!){
      _isServiceEnabled = await location.requestService();
    }
    return;
  }

  Future<void> initLocationPermission()async{
    permissionStatus = await location.hasPermission();

    if(permissionStatus == PermissionStatus.denied){
      permissionStatus = await location.requestPermission();
    }

    return;
  }

  Future<LocationData> getLocationData() async {
    locationData = await location.getLocation();
    return locationData!;
  }
}