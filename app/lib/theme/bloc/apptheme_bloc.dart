import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/prefernce.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'apptheme_event.dart';
part 'apptheme_state.dart';

class AppthemeBloc extends Bloc<AppthemeEvent, AppthemeState> {
  AppthemeBloc() : super(AppthemeState(theme: ThemeMode.dark));

  final SharedPreferences preferences = SHpref.pref;

  @override
  Stream<AppthemeState> mapEventToState(
    AppthemeEvent event,
  ) async* {
    if (event is AppThemeChage) {
      yield* _mapAppchangeToState(event.value);
    } else if (event is ThemeLoading) {
      yield* _mapAppthemeloading();
    }
  }

  Stream<AppthemeState> _mapAppchangeToState(bool value) async* {
    final bool mode = this.preferences.getBool("theme");
    if (value && mode) {
      this.preferences.setBool("theme", value);
      yield AppthemeState(theme: ThemeMode.dark);
    } else {
      this.preferences.setBool("theme", value);
      yield AppthemeState(theme: ThemeMode.light);
    }
  }

  Stream<AppthemeState> _mapAppthemeloading() async* {
    final bool mode = this.preferences.getBool("theme");
    if (mode == null) {
      this.preferences.setBool("theme", true);
      yield AppthemeState(theme: ThemeMode.dark);
    } else {
      yield AppthemeState(theme: mode ? ThemeMode.dark : ThemeMode.light);
    }
  }
}
