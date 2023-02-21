// ignore_for_file: annotate_overrides

import 'translations.dart';

class EnUs implements Translations {
  String get fullname => 'Full Name';
  String get email => 'Email';
  String get password => 'Password';
  String get nameNullError => 'Please Enter your full name';
  String get emailNullError => 'Please Enter your email';
  String get emailInvalidError => 'Please Enter valid email';
  String get passwordNullError => 'Please Enter your password';
  String get passwordShortError => 'Password is too short';

  String get loginTitle => 'Welcome Back!';
  String get loginSubtitle => 'Please sign in to your account';
  String get loginForgotPassword => 'Forgot Password?';
  String get loginSignIn => 'Sign In';
  String get loginDontHaveAccount => 'Don\'t have an account? ';
  String get loginSignUp => 'Sign Up';

  String get signupTitle => 'Create new account';
  String get signupSubtitle => 'Please fill in the form to continue';
  String get signupHaveAccount => 'Have an account? ';
  String get signup => 'Sign Up';
}
