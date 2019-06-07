import 'package:bloc/bloc.dart';
import 'bloc.dart';

class LoginBLoc extends Bloc<LoginEvent,LoginState>{
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginState.initial();


  bool _isEmailValid(String email){
    return _emailRegExp.hasMatch(email);
  }
  bool _isPasswordValid(String password){
    return password.length<5?false:true;
  }

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async*{
    if(event is EmailChanged){
      yield currentState.copyWith(
        email: event.email,
        isEmailValid: _isEmailValid(event.email),
      );
    }
    if(event is PasswordChange){
      yield currentState.copyWith(
        password: event.password,

        isPassword: _isPasswordValid(event.password),
      );
    }
    if(event is FormSubmitted){
      yield currentState.copyWith(
          formSubmittedSuccessfully: true
      );

    }
    if(event is FormRest){
      yield LoginState.initial();
    }

  }


}
