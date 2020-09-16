part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {}

class AuthenticationLogOut extends AuthenticationEvent {}

class AuthenticationLogin extends AuthenticationEvent {}

class AuthenticationSignUp extends AuthenticationEvent {}
