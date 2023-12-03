
import 'package:geolocator/geolocator.dart';

class LocationService {
  Position? _position ;

  static final LocationService _userSingleTon = LocationService._internal();

  factory LocationService() {
    return _userSingleTon;
  }

  LocationService._internal();

  set position(Position? value) => _position = value;
  Position? get position => _position;
}