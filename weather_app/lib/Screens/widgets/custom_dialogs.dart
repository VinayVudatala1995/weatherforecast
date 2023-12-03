
import 'package:flutter/material.dart';
import 'package:weather_app/res/color_manager.dart';
import 'package:weather_app/res/styles_manager.dart';

import '../../res/values_manager.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  const ErrorDialog({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center,child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      decoration: BoxDecoration(color: ColorManager.red,borderRadius: BorderRadius.circular(8.0)),
      height: 250,width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message,
          textAlign: TextAlign.center,style: getRegularStyle(color: ColorManager.white),),
        ],
      )));
  }
}




class PermissionDeniedDialog extends StatelessWidget {
  const PermissionDeniedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center,child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      decoration: BoxDecoration(color: ColorManager.primary,borderRadius: BorderRadius.circular(8.0)),
      height: 250,width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Location need to be allowed for this application',
          textAlign: TextAlign.center,style: getRegularStyle(color: ColorManager.white),),
        ],
      )));
       
  }
}