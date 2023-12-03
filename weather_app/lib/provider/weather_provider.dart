
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app/Screens/widgets/custom_dialogs.dart';
import 'package:weather_app/Service/loader_service.dart';
import 'package:weather_app/Service/network_service.dart';
import 'package:weather_app/model/weather_forecast_current_model.dart';
import 'package:weather_app/model/weather_forecast_hourly_model.dart';
import 'package:weather_app/repo/weather_repo.dart';
import 'package:weather_app/utils/app_logger.dart';

import '../utils/preferences_utils.dart';

class WeatherProvider with ChangeNotifier{
final String tag = 'Weather Provider';

WeatherForeCastHourlyModel? _weatherForeCastHourlyModel;
WeatherForeCastCurrentModel? _weatherForeCastCurrentModel;

WeatherProvider() {
  setCachedData();
}

setCachedData() async {
  String current =await  PreferenceUtils.getValue<String>(PreferencesConstants.CURRENT, '');
  String hourly =await  PreferenceUtils.getValue<String>(PreferencesConstants.HOURLY, '');

  if(current.isNotEmpty) _weatherForeCastCurrentModel = weatherForeCastCurrentModelFromJson(current);
  if(hourly.isNotEmpty) _weatherForeCastHourlyModel = weatherForeCastHourlyModelFromJson(hourly);
}


set weatherForeCastHourlyModel(WeatherForeCastHourlyModel? value) {
  _weatherForeCastHourlyModel = value;
  notifyListeners();
}

set weatherForeCastCurrentModel(WeatherForeCastCurrentModel? value) {
  _weatherForeCastCurrentModel = value;
  notifyListeners();
}


WeatherForeCastCurrentModel? get weatherForeCastCurrentModel => _weatherForeCastCurrentModel;
WeatherForeCastHourlyModel? get weatherForeCastHourlyModel => _weatherForeCastHourlyModel;


displayErrorDialog(String e){
SmartDialog.show(
  clickMaskDismiss:  true,
  backDismiss: true,
  builder: (_) {
      return ErrorDialog(message: e);
});
}

getHourlyWeatherForeCast() async {
  if(NetworkService().isConnectedToNetwork){
try {  
    LoaderNotifierService().showLoader();  
    WeatherForeCastHourlyModel?  response = await WeatherRepo().fetchWeatherForeCastHourly();
    if(response != null){
      weatherForeCastHourlyModel = response;
      PreferenceUtils.setValue<String>(PreferencesConstants.HOURLY, weatherForeCastHourlyModelToJson(response));
    }
  } catch (e) {
    displayErrorDialog(e.toString());
    AppLogger().error(e, tag);
  }
  LoaderNotifierService().dismissLoader();
  }
  
}


getCurrentWeatherForeCast() async {
  if(NetworkService().isConnectedToNetwork){
try {    
    LoaderNotifierService().showLoader();  
    WeatherForeCastCurrentModel?  response = await WeatherRepo().fetchWeatherForeCastCurrent();
    if(response != null){
      weatherForeCastCurrentModel = response;
      PreferenceUtils.setValue<String>(PreferencesConstants.CURRENT, weatherForeCastCurrentModelToJson(response));
    }
  } catch (e) {
    displayErrorDialog(e.toString());
    AppLogger().error(e, tag);
  }
  LoaderNotifierService().dismissLoader();
  }
  
}

}