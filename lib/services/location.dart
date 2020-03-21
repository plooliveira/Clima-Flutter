import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Position _position;
  Geolocator geolocator = Geolocator();


  Future<void> getCurrentLocation() async {
    try {
      _position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      this.latitude = _position.latitude;
      this.longitude = _position.longitude;
    }
    catch (e){
      print(e);
    }
  }
}
