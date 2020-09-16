part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;
  const LoginEmailChanged({this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => "Email Changed $email";
}

class LoginPasswordChange extends LoginEvent {
  final String password;
  const LoginPasswordChange({this.password});
  @override
  List<Object> get props => [password];

  @override
  String toString() => "Password change $password";
}

class LoginWithGoogle extends LoginEvent {}

class LoginWithCredentials extends LoginEvent {
  final String email;
  final String password;
  const LoginWithCredentials({this.email, this.password});
  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}
