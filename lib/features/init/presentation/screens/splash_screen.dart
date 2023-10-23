import 'dart:developer';

import 'package:demo_flutter_app/features/city/presentation/screens/city_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/routes/resource_images.dart';
import '../../../../core/theme/sizes.dart';
import '../../../../generated/l10n.dart';
import '../../../product/presentation/screens/products_screen.dart';
import '../../../user/bloc/user_bloc.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';

  final UserBloc userBloc = UserBloc();

  SplashScreen({super.key});

  Future<void> processScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    if (FirebaseAuth.instance.currentUser != null) {
      userBloc.add(FetchUser(userId: FirebaseAuth.instance.currentUser!.uid));
    } else {
      // ignore: use_build_context_synchronously
      if (!context.mounted) return;
      Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final S lang = S.of(context);

    processScreen(context);

    return BlocProvider<UserBloc>(
      create: (context) => userBloc,
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserFetched) {
            Navigator.of(context)
                .pushReplacementNamed(ProductsScreen.routeName);
          } else if (state is UserNotFound) {
            Navigator.of(context).pushReplacementNamed(CityScreen.routeName);
          } else if (state is UserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Error: ${state.message}'),
            ));
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  ballAnimation,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                Text(
                  lang.welcome,
                  style: const TextStyle(
                    fontSize: bigTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
