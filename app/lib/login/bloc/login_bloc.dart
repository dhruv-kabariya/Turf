import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:booking/services/userrepo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:booking/utils/validator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({@required this.user, @required this.authbloc})
      : assert(user != null),
        assert(authbloc != null),
        super(LoginState.initial());

  UserRepository user;
  AuthenticationBloc authbloc;

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoginEmailChanged && event is! LoginPasswordChange);
    });
    final debounceStream = events.where((event) {
      return (event is LoginEmailChanged || event is LoginPasswordChange);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  LoginState get initial => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEmailChanged) {
      yield* _mapLoginEmailChangeToState(event.email);
    } else if (event is LoginPasswordChange) {
      yield* _mapLoginPasswordToState(event.password);
    } else if (event is LoginWithCredentials) {
      yield* _mapLoginWithCredentialsToState(event.email, event.password);
    } else if (event is LoginWithGoogle) {
      yield* _mapLoginWithGoogleToState();
    }
  }

  Stream<LoginState> _mapLoginEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<LoginState> _mapLoginPasswordToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<LoginState> _mapLoginWithCredentialsToState(
      String email, String password) async* {
    yield LoginState.loading();
    try {
      await user.signIn(email, password);
      authbloc.add(AuthenticationLoggedIn());
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithGoogleToState() async* {
    yield LoginState.loading();

    user.signInWithGoogle();
    authbloc.add(AuthenticationLoggedIn());
  }
}
