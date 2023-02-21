import 'dart:async';

import 'package:bills_control_flutter/components/button.dart';
import 'package:bills_control_flutter/components/form_errors.dart';
import 'package:bills_control_flutter/constants.dart';
import 'package:bills_control_flutter/pages/home/home_page.dart';
import 'package:bills_control_flutter/pages/signup/signup_page.dart';
import 'package:bills_control_flutter/utils/i18n/i18n.dart';
import 'package:bills_control_flutter/utils/keyboard.dart';
import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool _isLoading = false;
  bool _redirecting = false;
  late final StreamSubscription<AuthState> _authStateSubscription;

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _signInUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      KeyboardUtil.hideKeyboard(context);

      setState(() {
        _isLoading = true;
      });
      try {
        await supabase.auth.signInWithPassword(
          password: password!,
          email: email,
        );
        if (mounted) {
          context.showSnackBar(message: 'Success');
        }
      } on AuthException catch (error) {
        context.showErrorSnackBar(message: error.message);
      } catch (error) {
        context.showErrorSnackBar(message: 'Unexpected error occurred');
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailField(),
          SizedBox(height: getProportionalScreenHeight(16)),
          buildPasswordField(),
          SizedBox(height: getProportionalScreenHeight(24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  R.strings.loginForgotPassword,
                  style: const TextStyle(
                    color: Colors.white30,
                  ),
                ),
              ),
            ],
          ),
          FormErrors(errors: errors),
          SizedBox(height: getProportionalScreenHeight(56)),
          Button(
            text: R.strings.loginSignIn,
            onTap: _isLoading ? null : _signInUser,
          ),
          SizedBox(height: getProportionalScreenHeight(56)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                R.strings.loginDontHaveAccount,
                style: const TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, SignUpPage.routeName);
                },
                child: Text(
                  R.strings.loginSignUp,
                  style: TextStyle(color: Colors.blue[600]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: R.strings.emailNullError);
        } else if (emailValidationRegExp.hasMatch(value)) {
          removeError(error: R.strings.emailInvalidError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: R.strings.emailNullError);
          return "";
        } else if (!emailValidationRegExp.hasMatch(value)) {
          addError(error: R.strings.emailInvalidError);
          return "";
        }
        return null;
      },
      decoration: kInputDecoration(R.strings.email),
      style: const TextStyle(color: Colors.white),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: R.strings.passwordNullError);
        } else if (value.length >= 6) {
          removeError(error: R.strings.passwordShortError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: R.strings.passwordNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: R.strings.passwordShortError);
          return "";
        }
        return null;
      },
      decoration: kInputDecoration(R.strings.password),
      style: const TextStyle(color: Colors.white),
    );
  }
}
