import 'package:bills_control_flutter/constants.dart';
import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'components/login_body.dart';

class LoginPage extends StatelessWidget {
  static String routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: LoginBody(),
    );
  }
}
