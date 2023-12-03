
import 'package:logger/logger.dart';

class AppLogger{
final bool _isProduction = false;
var logger = Logger();




void debug(dynamic msg,String tag){
 if(!_isProduction) logger.d('$tag ===> $msg');
}



void error(dynamic msg,String tag){
 if(!_isProduction) logger.e('$tag ===> $msg');
}



}