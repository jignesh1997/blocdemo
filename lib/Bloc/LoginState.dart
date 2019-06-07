import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPassword;
  final bool formSubmittedSuccessfully;
  bool get isFormValid => isEmailValid && isPassword;
  LoginState({
    @required this.email,
    @required this.password,
    @required this.isEmailValid,
    @required this.isPassword,
    @required this.formSubmittedSuccessfully,
  }) : super([
          email,
          password,
          isEmailValid,
          isPassword,
          formSubmittedSuccessfully
        ]);

  @override
  String toString() {
    return super.toString();
  }

  LoginState copyWith({
    String email,
    bool isEmailValid,
    String password,
    bool isPassword,
    bool formSubmittedSuccessfully,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPassword: isPassword ?? this.isPassword,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      formSubmittedSuccessfully:
          formSubmittedSuccessfully ?? this.formSubmittedSuccessfully,
    );
  }

  factory LoginState.initial() {
    return LoginState(
      email: '',
      password: '',
      isEmailValid: false,
      isPassword: false,
      formSubmittedSuccessfully: false,
    );
  }
}
