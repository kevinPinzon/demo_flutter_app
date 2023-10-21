import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../../core/enums.dart';
import '../../../../core/routes/resource_images.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_widget.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';

import '../../utils/keyboard_actions_configs.dart';
import '../../utils/validation_methods.dart';
import '../bloc/auth_bloc.dart';

abstract class AuthScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode emailNode = FocusNode();
  final FocusNode pwdNode = FocusNode();
  final AuthBloc authBloc = AuthBloc();

  final AuthScreenType authScreen;

  AuthScreen({
    super.key,
    required this.authScreen,
  });

  void onButtonPressed(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final S lang = S.of(context);
    final String appBarTitle =
        authScreen == AuthScreenType.login ? lang.login : lang.signUp;
    final String buttonLabel =
        authScreen == AuthScreenType.login ? lang.login : lang.createAccount;

    return BlocProvider(
      create: (context) => authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if ((state is CreateUserSuccessful) || state is SignInSuccessful) {
            final successMessage = authScreen == AuthScreenType.login
                ? lang.loginSuccessful
                : lang.registerSuccessful;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(successMessage),
            ));
            log('go to next screen');
          } else if (state is AuthError) {
            String? errorMessage;
            switch (state.code) {
              case 'email-already-in-use':
                errorMessage = lang.errorEmailAlreadyUse;
                break;
              case 'error-weak-password':
                errorMessage = lang.errorWeakPassword;
                break;
              case 'wrong-password':
                errorMessage = lang.wrongPassword;
                break;
              case 'user-not-found':
              case 'INVALID_LOGIN_CREDENTIALS':
                errorMessage = lang.errorUserNotFound;
                break;
              default:
                errorMessage = state.message;
                break;
            }
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Error: $errorMessage'),
            ));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              _buildBody(context, lang, appBarTitle, buttonLabel),
              if (state is Loading) const CustomLoadingWidget(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(
      BuildContext context, S lang, String appBarTitle, String buttonLabel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: SvgPicture.asset(flutterLogo, height: 100)),
          SingleChildScrollView(
            child: _buildForm(lang),
          ),
          CustomButton(
            text: buttonLabel,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onButtonPressed(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildForm(S lang) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: KeyboardActions(
        disableScroll: true,
        config: loginConfig(emailNode, pwdNode),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildEmailField(lang), _buildPasswordField(lang)],
          ),
        ),
      ),
    );
  }

  CustomInput _buildEmailField(S lang) {
    return CustomInput(
      hintText: lang.emailHintText,
      inputFieldTitle: lang.email,
      focusNode: emailNode,
      validator: (value) => ValidationMethods.validateMail(value, lang),
      onChanged: (value) => authBloc.add(ChangeEmailEvent(email: value)),
    );
  }

  CustomInput _buildPasswordField(S lang) {
    return CustomInput(
      hintText: lang.enterPassword,
      inputFieldTitle: lang.password,
      validator: (value) => ValidationMethods.validatePassword(value, lang),
      focusNode: pwdNode,
      onChanged: (value) => authBloc.add(ChangePasswordEvent(password: value)),
    );
  }
}
