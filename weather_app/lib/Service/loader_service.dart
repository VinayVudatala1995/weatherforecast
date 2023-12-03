
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app/Screens/widgets/loader_dialog.dart';
import 'package:weather_app/res/color_manager.dart';

class LoaderNotifierService {
  bool value = false;
  

  static final LoaderNotifierService _userSingleTon = LoaderNotifierService._internal();

  factory LoaderNotifierService() {
    return _userSingleTon;
  }

  LoaderNotifierService._internal();


  int count = 0;
  void toggle(bool newValue) {
    value = newValue;
    handleDialog();
  }

  showLoader() {
    count = count + 1;
    handleLoaderVisibility();
  }

  dismissLoader() {
    count = count - 1;
    handleLoaderVisibility();
  }

  handleLoaderVisibility() {
    if (count == 0) {
      toggle(false);
    } else if (count == 1) {
      toggle(true);
    }
  }


  handleDialog(){

    if (value) {
          SmartDialog.showLoading(
              animationType: SmartAnimationType.scale,
              maskColor:  Colors.transparent,
              builder: (_) => const LoaderDialog());
        } else  {
          SmartDialog.dismiss();
        }
  }
}