import '../../../generated/l10n.dart';
import 'string_custom_getters.dart';

class ValidationMethods {
  static String? validateMail(String? value, S lang) {
    if (value!.isEmpty) return lang.emailHintText;

    if (!value.isValidEmail) return lang.errorInvalidEmail;

    return null;
  }

  static String? validatePassword(String? value, S lang) {
    if (value!.isEmpty) return lang.passwordHintText;

    if (!value.isValidPassword) return lang.errorInvalidPassword;

    return null;
  }

}
