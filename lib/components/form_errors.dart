import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class FormErrors extends StatelessWidget {
  final List<String?> errors;

  const FormErrors({super.key, required this.errors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(error: errors[index]!),
      ),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Icon(Icons.error_outline, color: Colors.red[300]),
        SizedBox(width: getProportionalScreenWidth(10)),
        Text(
          error,
          style: TextStyle(color: Colors.red[300]),
        )
      ],
    );
  }
}
