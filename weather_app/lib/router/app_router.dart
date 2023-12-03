

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/layout/layout.dart';
import 'package:weather_app/res/routing_manager.dart';
import '../Screens/details/views/details_screen.dart';
import '../Screens/home/views/home_screen.dart';
part 'app_router.gr.dart';



@AutoRouterConfig()
class AppRouter extends _$AppRouter{

Route<T> customRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage page,
) {
  return PageRouteBuilder(
    transitionsBuilder: TransitionsBuilders.slideRight,
    transitionDuration: const Duration(milliseconds: 300),
    settings: page,
    pageBuilder: (BuildContext _ ,__, ___) => Layout(child: child)
  );
}

@override
List<AutoRoute> get routes  => 

[
  CustomRoute(
      path: RoutingStrings.homeRoute,    
      initial: true,  
      page: HomeRoute.page,    
      customRouteBuilder: customRouteBuilder,
    ),
  CustomRoute(
      path: RoutingStrings.detailsRoute,
      page: DetailsRoute.page,
      durationInMilliseconds: 100,
      customRouteBuilder: customRouteBuilder,
    ),

];
}