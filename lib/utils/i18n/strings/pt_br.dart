// ignore_for_file: annotate_overrides

import 'translations.dart';

class PtBr implements Translations {
  String get fullname => 'Nome Completo';
  String get email => 'E-mail';
  String get password => 'Senha';
  String get nameNullError => 'Informe seu nome completo';
  String get emailNullError => 'Informe seu e-mail';
  String get emailInvalidError => 'Informe um e-mail válido';
  String get passwordNullError => 'Informe sua senha';
  String get passwordShortError => 'Senha muito curta';

  String get loginTitle => 'Bem vindo de volta!';
  String get loginSubtitle => 'Por favor, entre com sua conta';
  String get loginForgotPassword => 'Esqueceu sua senha?';
  String get loginSignIn => 'Entrar';
  String get loginDontHaveAccount => 'Não tem uma conta? ';
  String get loginSignUp => 'Registrar';

  String get signupTitle => 'Crie nova conta';
  String get signupSubtitle => 'Por favor preencha o formulário para continuar';
  String get signupHaveAccount => 'Já tem conta? ';
  String get signup => 'Registrar';
}
