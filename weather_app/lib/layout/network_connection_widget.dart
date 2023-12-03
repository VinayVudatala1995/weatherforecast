import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/network_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/res/color_manager.dart';
import 'package:weather_app/res/routing_manager.dart';
import 'package:weather_app/res/styles_manager.dart';
import 'package:weather_app/utils/app_logger.dart';


class NetWorkConnectivityWidget extends StatelessWidget {
 bool? _previousValue;



  handleNetworkChanges(bool? value,bool? previousValue,BuildContext context){
    if(value != previousValue){
        if(value != null && value){
          context.read<WeatherProvider>().getCurrentWeatherForeCast();
           if(context.router.currentPath == RoutingStrings.detailsRoute){
            context.read<WeatherProvider>().getHourlyWeatherForeCast();
          }           
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Selector<NetworkProvider,bool?>(
       selector: (p0, np) => np.hasInternetConnection,
        builder: (context, value, child) {
        handleNetworkChanges(value,_previousValue,context);
        _previousValue = value;        
        return  Visibility(
          visible: value != null ? !value : true,
          maintainState: true,
          maintainSize: false,
          child: Container(width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: (value != null && value)? ColorManager.green : ColorManager.red ,borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0),topRight:Radius.circular(8.0) )),
          child: Text( value != null  ? value ? 'Connected' : 'No Internet Connection' : 'No Internet Connection',textAlign: TextAlign.center,style: getLightStyle(color: ColorManager.white),),
          
          ),
        );
   
        },
   
      ),
    );
    
    
  }
}