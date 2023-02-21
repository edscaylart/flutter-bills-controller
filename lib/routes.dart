import 'package:bills_control_flutter/pages/home/home_page.dart';
import 'package:bills_control_flutter/pages/login/login_page.dart';
import 'package:bills_control_flutter/pages/signup/signup_page.dart';
import 'package:bills_control_flutter/pages/splash/splash_page.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
  HomePage.routeName: (context) => const HomePage(),
};
