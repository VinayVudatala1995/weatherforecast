import 'package:flutter/material.dart';
import 'package:weather_app/res/values_manager.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../res/color_manager.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        
        height: 400,
        width: 400,
        child: Center(
        child: SizedBox(
      height: 50,
      width: 50,
      child: LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        colors: [
          ColorManager.primary,
          ColorManager.secondary,
          ColorManager.primary,
          ColorManager.secondary,
          ColorManager.primary,
          ColorManager.secondary,
          ColorManager.primary,
          ColorManager.secondary,
          ColorManager.primary,
          ColorManager.secondary
        ],
        strokeWidth: 1,
      ),
    ))
      ),
    );
       
  }
}