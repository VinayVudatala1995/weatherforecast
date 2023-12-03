

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/Service/network_service.dart';

class NetworkProvider extends ChangeNotifier{
  late StreamSubscription subscription;
  bool? _hasInternetConnection ;


  NetworkProvider(){
      listenToNetwork();
  }

  set hasInternetConnection(bool? value) { 
  _hasInternetConnection = value;
  NetworkService().isConnectedToNetwork = value!;
  notifyListeners();
  }

  
  bool? get hasInternetConnection => _hasInternetConnection;

  listenToNetwork(){
 subscription= Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {  

      hasInternetConnection =   await InternetConnectionChecker().hasConnection ;         
    });
  }


}