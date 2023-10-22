// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cityText": MessageLookupByLibrary.simpleMessage("Choose A city:"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create account"),
        "doNotHaveAccount": MessageLookupByLibrary.simpleMessage(
            "Don\'t you have an account yet?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailHintText":
            MessageLookupByLibrary.simpleMessage("Enter your Email"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "errorEmailAlreadyUse": MessageLookupByLibrary.simpleMessage(
            "The account already exists for that email."),
        "errorInvalidEmail":
            MessageLookupByLibrary.simpleMessage("Enter a valid email"),
        "errorInvalidPassword":
            MessageLookupByLibrary.simpleMessage("Enter a valid password"),
        "errorUserNotFound": MessageLookupByLibrary.simpleMessage(
            "No user found for that email."),
        "errorWeakPassword": MessageLookupByLibrary.simpleMessage(
            "The password provided is too weak."),
        "login": MessageLookupByLibrary.simpleMessage("Log in"),
        "loginSuccessful":
            MessageLookupByLibrary.simpleMessage("Successful login"),
        "loginWith": MessageLookupByLibrary.simpleMessage("LOG IN WITH"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordHintText":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "registerSuccessful": MessageLookupByLibrary.simpleMessage(
            "Your registration has been successful!"),
        "registerWith": MessageLookupByLibrary.simpleMessage("SIGN UP WITH"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "title": MessageLookupByLibrary.simpleMessage("Sport App"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome!"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "Wrong password provided for that user.")
      };
}
