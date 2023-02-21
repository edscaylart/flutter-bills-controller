import 'package:bills_control_flutter/components/button.dart';
import 'package:bills_control_flutter/components/form_errors.dart';
import 'package:bills_control_flutter/constants.dart';
import 'package:bills_control_flutter/pages/login/login_page.dart';
import 'package:bills_control_flutter/utils/i18n/i18n.dart';
import 'package:bills_control_flutter/utils/keyboard.dart';
import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;
  bool _isLoading = false;

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

  Future<void> _signUpUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      KeyboardUtil.hideKeyboard(context);
      setState(() {
        _isLoading = true;
      });
      try {
        await supabase.auth.signUp(
          password: password!,
          email: email,
          data: {'full_name': name},
        );
        if (mounted) {
          context.showSnackBar(message: 'Success!');
        }
      } on AuthException catch (error) {
        context.showErrorSnackBar(message: error.message);
      } catch (error) {
        debugPrint(error.toString());
        context.showErrorSnackBar(message: 'Unexpected error occurred');
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameField(),
          SizedBox(height: getProportionalScreenHeight(16)),
          buildEmailField(),
          SizedBox(height: getProportionalScreenHeight(16)),
          buildPasswordField(),
          SizedBox(height: getProportionalScreenHeight(16)),
          FormErrors(errors: errors),
          SizedBox(height: getProportionalScreenHeight(40)),
          Button(
            text: _isLoading ? 'Loading' : R.strings.signup,
            onTap: _isLoading ? null : _signUpUser,
          ),
          SizedBox(height: getProportionalScreenHeight(36)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                R.strings.signupHaveAccount,
                style: const TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                child: Text(
                  R.strings.loginSignIn,
                  style: TextStyle(color: Colors.blue[600]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: R.strings.nameNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: R.strings.nameNullError);
          return "";
        }
        return null;
      },
      decoration: kInputDecoration(R.strings.fullname),
      style: const TextStyle(color: Colors.white),
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
