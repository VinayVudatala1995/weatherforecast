import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/location_provider.dart';
import 'package:weather_app/provider/network_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './utils/preferences_utils.dart';
import './res/color_manager.dart';

void main() async {
  // Load .env file to get environment variables
  await dotenv.load(fileName: ".env");
  await PreferenceUtils.init();
  // Initialize and run the Flutter app
  runApp(Init());
}




class Init extends StatelessWidget {
  final _appRouter = AppRouter();
   Init({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        lazy: false,
        create: (_) => NetworkProvider(),),
        ChangeNotifierProvider(
        lazy: false,
        create: (_) => LocationProvider(),),
        ChangeNotifierProvider(
        lazy: false,
        create: (_) => WeatherProvider(),),
      ],
      
        child: MaterialApp.router(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primary),
            useMaterial3: true,      
              
          ),
          builder: FlutterSmartDialog.init(),
          routerConfig: _appRouter.config(),
        ),
      
    );
  }
}

