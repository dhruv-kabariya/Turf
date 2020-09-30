import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/services/userrepo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc(this.userRepository) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthenticationLogOut) {
      yield* _mapAuthenticationSignOutToState();
    } else if (event is AuthenticationLogin) {
      yield AuthenticationLoginScreen();
    } else if (event is AuthenticationSignUp) {
      yield AuthenticaionSignUpScreen();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    yield AuthenticationInitial();
    bool isSignIn = await userRepository.checkSignIn();
    if (isSignIn) {
      final name = userRepository.getUser();
      yield AuthenticationSuccess(name);
    } else {
      yield Authenticationfail();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
    yield AuthenticationSuccess(userRepository.getUser());
  }

  Stream<AuthenticationState> _mapAuthenticationSignOutToState() async* {
    userRepository.signOut();

    yield Authenticationfail();
  }
}
