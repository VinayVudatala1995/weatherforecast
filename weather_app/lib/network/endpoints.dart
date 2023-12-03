

String baseUrl = "https://api.weatherbit.io/v2.0/";



String url_WeatherForeCastCurrent = 'current?lat={latitude}&lon={longitude}&key={key}';
String url_WeatherForeCastHourly = 'forecast/hourly?lat={latitude}&lon={longitude}&key={key}';



// Future<LoginResponse> login(loginRequest loginRequest) {

//   try {
//     Stirng url  = baseUrl  + url_getTimeslotsUrl;
//     // post   body 
//     ApiResponse apiResponse  =ApiBaseHelper().post(url, loginRequest, {})
//     if(apiResponse.status){
//       loginResponseFromJson(apiResponse.data);
//     }
     
//   } catch (e) {
//     throw e;
//   }

// }