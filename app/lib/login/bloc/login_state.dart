part of 'login_bloc.dart';

@immutable
class LoginState {
  final bool isEmailValid;
  final bool isPasswordVlid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFaild;

  LoginState(
      {@required this.isEmailValid,
      @required this.isPasswordVlid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFaild});

  factory LoginState.initial() {
    return LoginState(
        isEmailValid: true,
        isPasswordVlid: true,
        isSubmitting: false,
        isSuccess: false,
        isFaild: false);
  }

  factory LoginState.loading() {
    return LoginState(
        isEmailValid: true,
        isPasswordVlid: true,
        isSubmitting: true,
        isSuccess: false,
        isFaild: false);
  }

  factory LoginState.failure() {
    return LoginState(
        isEmailValid: true,
        isPasswordVlid: true,
        isSubmitting: false,
        isSuccess: false,
        isFaild: true);
  }

  factory LoginState.success() {
    return LoginState(
        isEmailValid: true,
        isPasswordVlid: true,
        isSubmitting: false,
        isSuccess: true,
        isFaild: false);
  }

  LoginState copywith(
      {bool isEmailValid,
      bool isPasswordVlid,
      bool isSubmitting,
      bool isSuccess,
      bool isFaild}) {
    return LoginState(
        isEmailValid: isEmailValid ?? isEmailValid,
        isPasswordVlid: isPasswordVlid ?? isPasswordVlid,
        isSubmitting: isSubmitting ?? isSubmitting,
        isSuccess: isSuccess ?? isSuccess,
        isFaild: isFaild ?? isFaild);
  }

  LoginState update({isEmailValid, isPasswordValid}) {
    return copywith(
        isEmailValid: isEmailValid,
        isPasswordVlid: isPasswordValid,
        isSubmitting: false,
        isSuccess: false,
        isFaild: false);
  }

  @override
  String toString() => "";
}
