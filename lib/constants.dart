import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final RegExp emailValidationRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const kPrimaryColor = Color(0xFF8AD57D);
const kBackgroundColor = Color(0xFF181920);
const kSecondaryColor = Color(0xFF1C2129);

InputDecoration kInputDecoration(String hintText) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 26,
      vertical: 20,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Color(0xAF262A34)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    hintText: hintText,
    filled: true,
    fillColor: const Color(0xAF262A34),
    hintStyle: const TextStyle(color: Colors.white30),
  );
}

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.green,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
