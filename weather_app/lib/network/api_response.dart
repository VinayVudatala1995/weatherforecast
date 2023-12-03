



import './api_base_helper.dart';

class ApiResponse {
  ApiStatus status;

  dynamic data; // Response from back end

  Map<String, String>? headers; 

  ApiResponse({required this.status, this.data, this.headers});
}
