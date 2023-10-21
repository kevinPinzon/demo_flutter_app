import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/routes/resource_images.dart';
import '../../../../core/theme/sizes.dart';
import '../../../../generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';

  const SplashScreen({super.key});

  Future<void> processScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    if (FirebaseAuth.instance.currentUser != null) {
      print('user detected');
    } else {
      print('user dont detected');
    }
  }

  @override
  Widget build(BuildContext context) {
    final S lang = S.of(context);

    processScreen(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              dogAnimation,
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
    );
  }
}
