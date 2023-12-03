import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/app_logger.dart';
import './api_response.dart';




enum ApiStatus { SUCCESS, EXCEPTION, UNAUTHORISED, ERROR }
class ApiBaseHelper {
  Future<ApiResponse> get({ required Uri url, Map<String, String> headers = const  {}}) async {
    final response = await http.get(url, headers: headers);

    return await _returnResponse(response);
  }

 
  dynamic _returnResponse(http.Response response) async {
AppLogger().debug(utf8.decode(response.bodyBytes), 'Response ::');
    switch (response.statusCode) {
      case 200:
        var result = utf8.decode(response.bodyBytes);
        return ApiResponse(status: ApiStatus.SUCCESS, data: result, headers: response.headers);

      case 201:
        final result = utf8.decode(response.bodyBytes);
        return ApiResponse(status: ApiStatus.SUCCESS, data: result);
      case 400:
        return ApiResponse(status: ApiStatus.ERROR, data: "BadRequest: ${response.statusCode}");
      case 401:
        return ApiResponse(status: ApiStatus.UNAUTHORISED, data: "Unauthorised.StatusCode : ${response.statusCode}");
      case 403:
        return ApiResponse(status: ApiStatus.UNAUTHORISED, data: "Unauthorised.StatusCode : ${response.statusCode}");
      case 404:
        return ApiResponse(status: ApiStatus.ERROR, data: "Path Not Found : ${response.statusCode}");
      case 408:
        return ApiResponse(status: ApiStatus.ERROR, data: "Timeout.StatusCode : ${response.statusCode}");
      case 500:
      case 501:
      case 502:
        return ApiResponse(status: ApiStatus.ERROR, data: "Error occured while Communication with Server with StatusCode : ${response.statusCode}");

      default:
        return ApiResponse(status: ApiStatus.ERROR, data: "Error occured while Communication with Server with StatusCode : ${response.statusCode}");
    }
  }
}
  