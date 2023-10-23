// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sport App`
  String get title {
    return Intl.message(
      'Sport App',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get emailHintText {
    return Intl.message(
      'Enter your Email',
      name: 'emailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHintText {
    return Intl.message(
      'Enter your password',
      name: 'passwordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get errorInvalidEmail {
    return Intl.message(
      'Enter a valid email',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid password`
  String get errorInvalidPassword {
    return Intl.message(
      'Enter a valid password',
      name: 'errorInvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't you have an account yet?`
  String get doNotHaveAccount {
    return Intl.message(
      'Don\'t you have an account yet?',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP WITH`
  String get registerWith {
    return Intl.message(
      'SIGN UP WITH',
      name: 'registerWith',
      desc: '',
      args: [],
    );
  }

  /// `LOG IN WITH`
  String get loginWith {
    return Intl.message(
      'LOG IN WITH',
      name: 'loginWith',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message(
      'Welcome!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Successful login`
  String get loginSuccessful {
    return Intl.message(
      'Successful login',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Your registration has been successful!`
  String get registerSuccessful {
    return Intl.message(
      'Your registration has been successful!',
      name: 'registerSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get errorEmailAlreadyUse {
    return Intl.message(
      'The account already exists for that email.',
      name: 'errorEmailAlreadyUse',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get errorWeakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get errorUserNotFound {
    return Intl.message(
      'No user found for that email.',
      name: 'errorUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPassword {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Choose A city:`
  String get cityText {
    return Intl.message(
      'Choose A city:',
      name: 'cityText',
      desc: '',
      args: [],
    );
  }

  /// `Trending Products`
  String get productsText {
    return Intl.message(
      'Trending Products',
      name: 'productsText',
      desc: '',
      args: [],
    );
  }

  /// `City selected:`
  String get citySelectedTitle {
    return Intl.message(
      'City selected:',
      name: 'citySelectedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email:`
  String get emailSelectedTitle {
    return Intl.message(
      'Email:',
      name: 'emailSelectedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Oops! unexpected error`
  String get errorMessage {
    return Intl.message(
      'Oops! unexpected error',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
