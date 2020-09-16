part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SignUpEmailChanged extends SignupEvent {
  final String email;
  SignUpEmailChanged({@required this.email});
  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class PasswordChange extends SignupEvent {
  final String password;
  const PasswordChange({@required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [password];
}

class SignupWithCredentials extends SignupEvent {
  final String email;
  final String password;

  const SignupWithCredentials({@required this.email, @required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}

class SignupwithGoogle extends SignupEvent {}
