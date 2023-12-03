
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/details/views/hourly_row.dart';
import 'package:weather_app/model/weather_forecast_hourly_model.dart' as hourly;
import '../../../model/weather_forecast_current_model.dart';
import '../../../provider/weather_provider.dart';
import '../../../res/color_manager.dart';
import '../../../res/font_manager.dart';
import '../../../res/styles_manager.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getHourlyWeatherForeCast();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Selector<WeatherProvider, WeatherForeCastCurrentModel?>(
              builder: (_, value, __) {
                return value != null
                    ? Hero(
                        tag: 'current',
                        child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFA11AF6),
                                    Color(0xFF2978D9),
                                  ],
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                          onPressed: () {
                                            context.router.pop();
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_outlined,
                                            color: ColorManager.white,
                                          ))),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      
                                          Column(
                                        children: [
                                          Text(
                                            'Today',
                                            textAlign: TextAlign.center,
                                            style: getBoldStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s14),
                                          ),
                                          Text(
                                            '${value.data?[0].appTemp.toString() ?? '0'}' +
                                                "\u00b0",
                                            textAlign: TextAlign.center,
                                            style: getBoldStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s60),
                                          ),
                                          Text(
                                              value.data?[0].weather
                                                      ?.description
                                                      .toString() ??
                                                  '',
                                              textAlign: TextAlign.center,
                                              style: getLightStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s16),
                                            ),
                                        ],
                                      ),
                                    
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Wind Force',
                                                style: getRegularStyle(
                                                    color: ColorManager.white,
                                                    fontSize: FontSize.s20),
                                              ),
                                              Text(
                                                '${value.data?[0].windSpd.toString() ?? '0'}' +
                                                    "km\h",
                                                style: getRegularStyle(
                                                    color: ColorManager.white),
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Precipitation',
                                                style: getRegularStyle(
                                                    color: ColorManager.white,
                                                    fontSize: FontSize.s20),
                                              ),
                                              Text(
                                                '${value.data?[0].precip.toString() ?? '0'}' +
                                                    "%",
                                                style: getRegularStyle(
                                                    color: ColorManager.white),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            )),
                      )
                    : const SizedBox.shrink();
              },
              selector: (_, lp) => lp.weatherForeCastCurrentModel),
        ),
        Expanded(
            flex: 1,
            child:
                Selector<WeatherProvider, hourly.WeatherForeCastHourlyModel?>(
              selector: (_, wp) => wp.weatherForeCastHourlyModel,
              builder: (context, value, child) {
                return value != null
                    ? GridView.count(
                        crossAxisCount: 5,
                        children:List.generate(value.data!.length, (index) {
                      return HourlyRow(data: value.data![index]);
                       },),
                        
                    )
                       
                      
                    : SizedBox.shrink();
              },
            ))
      ],
    );
  }
}
