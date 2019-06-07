
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
@immutable
abstract class LoginEvent extends Equatable{
  LoginEvent([List props=const []]):super(props);
}
class EmailChanged extends LoginEvent{
  final String email;
  EmailChanged(
      @required this.email

      ):super([email]);
  @override
  String toString() => 'EmailChanged { email: $email }';

}
class PasswordChange extends LoginEvent{
    final String password;
  PasswordChange(
      @required this.password,
      ):super([password]);

}
class FormSubmitted extends LoginEvent{
  @override
  String toString() => 'FormSubmitted';
}
class FormRest extends LoginEvent{
  @override
  String toString() => 'FormReset';
}