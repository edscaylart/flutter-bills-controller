import 'package:bills_control_flutter/constants.dart';
import 'package:bills_control_flutter/pages/signup/components/signup_body.dart';
import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String routeName = '/signup';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: SignUpBody(),
    );
  }
}
