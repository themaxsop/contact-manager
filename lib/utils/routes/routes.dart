import 'package:contact_app/utils/routes/routes_name.dart';
import 'package:contact_app/view/home_screen.dart';
import 'package:contact_app/view/login_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Route not found.'),
            ),
          );
        });
    }
  }
}
