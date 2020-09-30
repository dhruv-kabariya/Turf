part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpEmailChanged extends SignupEvent {
  final String email;
  SignUpEmailChanged({@required this.email});
  @override
  List<Object> get props => [email];
}

class PasswordChange extends SignupEvent {
  final String password;
  const PasswordChange({@required this.password});

  @override
  List<Object> get props => [password];
}

class NameCheck extends SignupEvent {
  final String name;

  const NameCheck({@required this.name});
  @override
  List<Object> get props => [name];
}

class SignupWithCredentials extends SignupEvent {
  final String email;
  final String password;
  final String name;

  const SignupWithCredentials(
      {@required this.email, @required this.password, @required this.name});
  @override
  List<Object> get props => [email, password, name];
}

class SignupwithGoogle extends SignupEvent {}
