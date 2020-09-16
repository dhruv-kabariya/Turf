part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String name;
  const AuthenticationSuccess(this.name);

  @override
  List<Object> get props => [name];

  @override
  String toString() => "AUthentication $name";
}

class Authenticationfail extends AuthenticationState {}

class AuthenticationLoginScreen extends Authenticationfail {}

class AuthenticaionSignUpScreen extends Authenticationfail {}
