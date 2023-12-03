import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Screens/widgets/custom_dialogs.dart';
import 'package:weather_app/Service/location_service.dart';
import 'package:weather_app/utils/app_logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Service/loader_service.dart';


class LocationProvider  extends ChangeNotifier {
  String tag = 'Location Service';
  Position? _position;
    
  LocationProvider(){
    verifyPermissionAndGetLocation();
  }

  
  Position? get position => _position; // Get longitude


   set position(Position? value) {
    _position = value;
    LocationService().position = value;
    notifyListeners();
  }

  ///Check permission 
  ///if granted fetch user current location
  ///denied : request for location permission
  void verifyPermissionAndGetLocation() async {
  PermissionStatus  _permission = await Permission.location.status;
    
    if (_permission == PermissionStatus.granted)
      _getLocation();
    else
      _requestPermissionToAccessLocation();
  }

  // show message that this application is based on location to accept  
  void permissionDeniedDisplayDialog() {
    SmartDialog.show(
        clickMaskDismiss: true,
        backDismiss: true,
        maskColor: Colors.transparent,
        builder: (BuildContext ctx) {
          return const PermissionDeniedDialog();
        }).then((value) {
          SmartDialog.dismiss();      
        _requestPermissionToAccessLocation();
      
    });
  }

  // Request location permission
  void _requestPermissionToAccessLocation() async {
    try {
     PermissionStatus  _permission = await Permission.location.request();
      if (_permission == PermissionStatus.granted) {
        _getLocation();
      } else {
        permissionDeniedDisplayDialog();
      }
    } catch (e) {
      AppLogger().error(e, tag);
    }
  }

  // fetch user
  void _getLocation() async {
    LoaderNotifierService().showLoader();  
    try {
      Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // Access location using Location plugin or any other method
      position = pos;
      AppLogger().debug(position, tag);
      
    } catch (e) {
      AppLogger().error(e, tag);
      return null;
    } 
    LoaderNotifierService().dismissLoader();     
  }



}
