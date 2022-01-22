import 'package:flutter/material.dart';
import 'package:ipark/pages/slides.dart';
import 'package:ipark/screens/location/location_screan.dart';
import 'package:ipark/screens/home/home_screan.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return Slides.route();
      // case Slides.routeName();
      // return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      // case FilterScreen.routeName:
      //   return FilterScreen.route();
     
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
