import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:booking/services/userrepo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';

import 'package:booking/utils/validator.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({@required this.authbloc, @required this.userrepo})
      : assert(userrepo != null),
        assert(authbloc != null),
        super(SignupState.initial());

  AuthenticationBloc authbloc;
  UserRepository userrepo;

  @override
  Stream<Transition<SignupEvent, SignupState>> transformEvents(
      Stream<SignupEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! SignUpEmailChanged && event is! PasswordChange);
    });
    final debounceStream = events.where((event) {
      return (event is SignUpEmailChanged || event is PasswordChange);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignUpEmailChanged) {
      yield* _mapSignupEmialChangetoState(event.email);
    } else if (event is PasswordChange) {
      yield* _mapPasswordchangeToState(event.password);
    } else if (event is SignupwithGoogle) {
      yield* _mapSignupwithGoogleToState();
    } else if (event is SignupWithCredentials) {
      yield* _mapSignupwithCredetialsTostate(event.email, event.password);
    }
  }

  Stream<SignupState> _mapSignupEmialChangetoState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<SignupState> _mapPasswordchangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<SignupState> _mapSignupwithGoogleToState() async* {
    yield SignupState.loading();

    userrepo.signUpWithGoogle();
    authbloc.add(AuthenticationLoggedIn());
  }

  Stream<SignupState> _mapSignupwithCredetialsTostate(
      String email, String password) async* {
    yield SignupState.loading();

    userrepo.signUp(email, password);
    authbloc.add(AuthenticationLoggedIn());
  }
}
