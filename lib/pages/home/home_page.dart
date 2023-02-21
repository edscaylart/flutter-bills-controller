import 'package:bills_control_flutter/constants.dart';
import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionalScreenWidth(16),
            ),
            child: Column(children: const [
              Header(),
            ]),
          ),
        ),
      ),
    );
  }
}
