import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude,langitude;
  Future<void> getCurrentPosition() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    latitude=position.latitude;
    langitude=position.longitude;
  }
}