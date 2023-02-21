import 'package:flutter/widgets.dart';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode focusNode = FocusScope.of(context);
    if (!focusNode.hasPrimaryFocus) {
      focusNode.unfocus();
    }
  }
}
