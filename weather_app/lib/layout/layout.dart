import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/location_provider.dart';
import 'package:weather_app/res/color_manager.dart';

import '../res/styles_manager.dart';
import './network_connection_widget.dart';



class Layout extends StatefulWidget {
  Widget child;
  Layout({super.key,required this.child});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: 
            Selector<LocationProvider,Position?>(builder: (_,value,__) {
              return value != null ? widget.child :  
             const SizedBox.shrink();
            }, selector: (_,lp) => lp.position),
            
            ),
             NetWorkConnectivityWidget()
          ],
         
        )       
      ),
    );
  }
}