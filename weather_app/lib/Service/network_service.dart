
class NetworkService {
  bool _isConnectedToNetwork = false;

  static final NetworkService _userSingleTon = NetworkService._internal();

  factory NetworkService() {
    return _userSingleTon;
  }

  NetworkService._internal();

  set isConnectedToNetwork(bool value) => _isConnectedToNetwork = value;
  bool get isConnectedToNetwork => _isConnectedToNetwork;
}