import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../bloc/auth_bloc.dart';
import 'auth_screen.dart';

class LoginScreen extends AuthScreen {
  static const routeName = 'authentication/login-screen';

  LoginScreen({super.key})
      : super(
          authScreen: AuthScreenType.login,
        );

  @override
  void onButtonPressed(BuildContext context) {
    authBloc.add(SignIn());
  }
}
