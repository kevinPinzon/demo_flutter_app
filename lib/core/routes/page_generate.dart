import 'package:demo_flutter_app/features/city/presentation/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/signup_screen.dart';
import '../../features/init/presentation/screens/welcome_screen.dart';
import '../../features/init/presentation/screens/splash_screen.dart';
import '../../features/product/presentation/screens/products_screen.dart';

class PageClassGenerator {
  static Route<dynamic> getNamedScreen(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        builder = (context) => SplashScreen();
        break;
      case WelcomeScreen.routeName:
        builder = (context) => const WelcomeScreen();
        break;
      case SignUpScreen.routeName:
        builder = (context) => SignUpScreen();
        break;
      case LoginScreen.routeName:
        builder = (context) => LoginScreen();
        break;
      case CityScreen.routeName:
        builder = (context) => CityScreen();
        break;
      case ProductsScreen.routeName:
        builder = (context) => ProductsScreen();
        break;
      default:
        builder = (context) => const Material(
              child: Center(
                child: Text('It has not yet been implemented.'),
              ),
            );
    }
    return _commonPageWrapper(
      routeSettings: routeSettings,
      builder: builder,
    );
  }

  static Route<dynamic> _commonPageWrapper({
    required RouteSettings routeSettings,
    required Widget Function(BuildContext) builder,
  }) {
    return MaterialWithModalsPageRoute(
      settings: routeSettings,
      builder: (context) => Container(
        color: Colors.black.withOpacity(0.4),
        child: SafeArea(
          top: false,
          bottom: false,
          child: builder(context),
        ),
      ),
    );
  }
}
