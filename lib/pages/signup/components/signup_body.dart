import 'package:bills_control_flutter/utils/i18n/i18n.dart';
import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'signup_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionalScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Text(
                  R.strings.signupTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionalScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  R.strings.signupSubtitle,
                  style: const TextStyle(color: Colors.white30),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
