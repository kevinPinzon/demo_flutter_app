import 'package:flutter/material.dart';
import '../../../../core/enums.dart';
import '../bloc/auth_bloc.dart';
import 'auth_screen.dart';

class SignUpScreen extends AuthScreen {
  static const routeName = 'authentication/signup-screen';

  SignUpScreen({super.key})
      : super(
          authScreen: AuthScreenType.signUp,
        );

  @override
  void onButtonPressed(BuildContext context) {
    authBloc.add(CreateUser());
  }
}
