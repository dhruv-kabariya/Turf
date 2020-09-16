import 'package:booking/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:booking/login/ui/loginscreen.dart';
import 'package:booking/signup/UI/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      cubit: BlocProvider.of<AuthenticationBloc>(context),
      builder: (context, state) {
        if (state is AuthenticaionSignUpScreen) {
          return SignUpForm(
              authbloc: BlocProvider.of<AuthenticationBloc>(context),
              userrepo:
                  BlocProvider.of<AuthenticationBloc>(context).userRepository);
        } else {
          return LoginScreen(
              authbloc: BlocProvider.of<AuthenticationBloc>(context),
              user:
                  BlocProvider.of<AuthenticationBloc>(context).userRepository);
        }
      },
    );
  }
}
