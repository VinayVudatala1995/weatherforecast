import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Service/location_service.dart';
import 'package:weather_app/model/weather_forecast_current_model.dart';
import 'package:weather_app/model/weather_forecast_hourly_model.dart';
import 'package:weather_app/network/api_base_helper.dart';
import 'package:weather_app/network/api_response.dart';
import 'package:weather_app/network/endpoints.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherRepo{

replaceStringsWithLatLongKey(String url,Position position){  
url =  url.replaceAll('{latitude}', position.latitude.toString());
url = url.replaceAll('{longitude}', position.longitude.toString());
url = url.replaceAll('{key}', dotenv.env['WEATHER_API_KEY'].toString());
return url;
}
 
Future<WeatherForeCastCurrentModel?> fetchWeatherForeCastCurrent() async{
Position? position = LocationService().position;

try {
  if(position != null){
    String url = replaceStringsWithLatLongKey(url_WeatherForeCastCurrent,position);
ApiResponse apiResponse = await ApiBaseHelper().get(url: Uri.parse('$baseUrl$url'));
  if(apiResponse.status == ApiStatus.SUCCESS){
    return weatherForeCastCurrentModelFromJson(apiResponse.data);
  }  
  return null;
  }
  
    
} catch (e) {
  throw e;
}
}


Future<WeatherForeCastHourlyModel?> fetchWeatherForeCastHourly() async{
try {
  Position? position = LocationService().position;
if(position != null){
  String url = replaceStringsWithLatLongKey(url_WeatherForeCastHourly,position);
 
  ApiResponse apiResponse = await ApiBaseHelper().get(url: Uri.parse('$baseUrl$url'));
  if(apiResponse.status == ApiStatus.SUCCESS){
    return weatherForeCastHourlyModelFromJson(apiResponse.data);
  }
  
  return null;  
}

   
} catch (e) {
  throw e;
}

}

}