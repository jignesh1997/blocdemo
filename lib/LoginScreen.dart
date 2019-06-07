import 'package:flutter/material.dart';
import 'Bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("stare");
 return  LoginScreenState();
  }
}
class LoginScreenState extends State<LoginScreen>{
  final LoginBLoc _loginBloc=LoginBLoc();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChange);
    _passwordController.addListener(_onPasswordChnage);
    print("stare");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Flutter Form Validation')),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder(
          bloc: _loginBloc,
          builder: (BuildContext context, LoginState state) {
            if (state.formSubmittedSuccessfully) {
              return SuccessDialog(onDismissed: () {
                _emailController.clear();
                _passwordController.clear();
                _loginBloc.dispatch(FormRest());
              });
            }
            return Form(
              child: Column(
                children: <Widget>[
                  TextFormField(

                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    autovalidate: true,
                    validator: (_) {
                      return state.isEmailValid ? null : 'Invalid Email';
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.amber,
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),

                    autovalidate: true,
                    validator: (_) {
                      return state.isPassword ? null : 'Invalid Password';
                    },
                  ),
                  RaisedButton(
                    onPressed: state.isFormValid ? _onSubmitPressed : null,
                    child: Text('Submit'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  void _onEmailChange(){
    _loginBloc.dispatch(EmailChanged(_emailController.text));
  }
  void _onPasswordChnage(){
    _loginBloc.dispatch(PasswordChange(_passwordController.text));
  }
  void _onSubmitPressed(){
    _loginBloc.dispatch(FormSubmitted());
  }
  

}
class SuccessDialog extends StatelessWidget {
  final VoidCallback onDismissed;

  SuccessDialog({Key key, @required this.onDismissed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(Icons.info),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Form Submitted Successfully!',
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('OK'),
            onPressed: onDismissed,
          ),
        ],
      ),
    );
  }
}