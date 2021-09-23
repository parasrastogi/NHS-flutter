import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    this.latitude = position.latitude;
    this.longitude = position.longitude;
    //  print("${position.latitude}, ${position.longitude}");
  }
}
