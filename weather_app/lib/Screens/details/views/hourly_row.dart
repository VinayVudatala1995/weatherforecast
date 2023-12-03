import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/res/values_manager.dart';
import 'package:weather_app/utils/extensions.dart';

import '../../../model/weather_forecast_hourly_model.dart';
import '../../../res/color_manager.dart';
import '../../../res/font_manager.dart';
import '../../../res/styles_manager.dart';


class HourlyRow extends StatelessWidget {
  final Datum data;
  const HourlyRow({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return   Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        data.timestampLocal
                                                .toString()
                                                .stringToDateTime() ??
                                            '',
                                        style: getLightStyle(
                                            color: ColorManager.white),
                                      ),
                                      const Gap(AppSize.s12),
                                      Text(
                                        '${data.appTemp.toString() ?? '0'}' +
                                            "\u00b0",
                                        textAlign: TextAlign.center,
                                        style: getBoldStyle(
                                            color: ColorManager.white,
                                            fontSize: FontSize.s18),
                                      )
                                    ],
                                  ),
                                );
                              
  }
}