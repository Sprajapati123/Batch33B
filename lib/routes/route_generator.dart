import 'package:flutter/material.dart';
import 'package:week_3/add_products/add_product_screen.dart';
import 'package:week_3/form_screen/form_screen.dart';
import 'package:week_3/navigation/navigation_screen.dart';
import 'package:week_3/registration/registration_screen.dart';
import 'package:week_3/splash/splash_screen.dart';
import 'package:week_3/tabbar/tabbar_screen.dart';

import '../login/login_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());

      case AddProductScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());

      case NavigationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NavigationScreen());

      case FormScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FormScreen());

      case TabBarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TabBarScreen());

      default:
        _onPageNotFound();
    }
  }

  static Route<dynamic> _onPageNotFound() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(body: Text("Page not found")),
    );
  }
}
