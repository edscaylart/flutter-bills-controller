import 'package:bills_control_flutter/constants.dart';
import 'package:bills_control_flutter/utils/i18n/i18n.dart';
import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function? onTap;
  final String? text;

  const Button({
    super.key,
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionalScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          foregroundColor: Colors.white,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: onTap as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionalScreenWidth(16),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
