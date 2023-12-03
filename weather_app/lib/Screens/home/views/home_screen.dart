
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_forecast_current_model.dart';
import 'package:weather_app/provider/network_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/res/color_manager.dart';
import 'package:weather_app/res/font_manager.dart';
import 'package:weather_app/res/routing_manager.dart';
import 'package:weather_app/res/styles_manager.dart';
import 'package:weather_app/utils/extensions.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
 getCurrentWeatherForeCast();
  }

 Future<void> getCurrentWeatherForeCast() async{
 context.read<WeatherProvider>().getCurrentWeatherForeCast() ;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherProvider, WeatherForeCastCurrentModel?>(
        builder: (_, value, __) {
          return value != null
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          context.router.pushNamed(RoutingStrings.detailsRoute);
                        },
                        child: Hero(
                          tag: 'current',
                          child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: getCurrentWeatherContainerDecoration(),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                  
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          value.data?[0].cityName ?? '',
                                          textAlign: TextAlign.center,
                                          style: getBoldStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s18),
                                        ),
                                        Text(
                                          '${value.data?[0].appTemp.toString() ?? '0'}' +
                                              "\u00b0",
                                          textAlign: TextAlign.center,
                                          style: getBoldStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s60),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                value.data?[0].weather
                                                        ?.description
                                                        .toString() ??
                                                    '',
                                                textAlign: TextAlign.center,
                                                style: getBoldStyle(
                                                    color: ColorManager.white,
                                                    fontSize: FontSize.s30),
                                              ),
                                              Text(
                                                value.data?[0].ts
                                                        .toString()
                                                        .epochToDate() ??
                                                    '',
                                                textAlign: TextAlign.center,
                                                style: getBoldStyle(
                                                    color: ColorManager.white,
                                                    fontSize: FontSize.s18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
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
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                )
              :  Container(alignment: Alignment.center,child: Text(context.watch<NetworkProvider>().hasInternetConnection == true   ? '' : 'Please check your internet' ,style: getRegularStyle(color: ColorManager.white),),);
        },
        selector: (_, lp) => lp.weatherForeCastCurrentModel);
  }
}
