import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../features/init/presentation/screens/splash_screen.dart';

class PageClassGenerator {
  static Route<dynamic> getNamedScreen(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        builder = (context) => const SplashScreen();
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
