import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routes/resource_images.dart';
import '../../../../core/theme/sizes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../../../authentication/presentation/screens/login_screen.dart';
import '../../../authentication/presentation/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = 'authentication/welcome-screen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final S lang = S.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(lang.title),
        ),
        body: _bodyScreen(context, lang));
  }

  Widget _bodyScreen(BuildContext context, S lang) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 3, child: Center(child: Image.asset(ballsSports))),
        Expanded(flex: 1, child: _actions(context, lang)),
      ],
    );
  }

  Widget _actions(BuildContext context, S lang) {
    final NavigatorState router = Navigator.of(context);
    return Column(
      children: [
        _goCreateAccount(router, lang),
        const SizedBox(
          height: 20,
        ),
        _goLogin(router, lang),
      ],
    );
  }

  Widget _goCreateAccount(NavigatorState router, S lang) {
    return CustomButton(
      text: lang.createAccount,
      onPressed: () => router.pushNamed(
        SignUpScreen.routeName,
      ),
    );
  }

  Widget _goLogin(NavigatorState router, S lang) {
    return CustomButton(
      text: lang.login,
      onPressed: () => router.pushNamed(
        LoginScreen.routeName,
      ),
    );
  }
}
