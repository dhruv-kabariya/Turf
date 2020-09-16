import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking/services/settingservice.dart';
import 'package:booking/theme/appTheme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'apptheme_event.dart';
part 'apptheme_state.dart';

class AppthemeBloc extends Bloc<AppthemeEvent, AppthemeState> {
  AppthemeBloc({@required this.service}) : super(AppThemeDark());

  final SettingService service;

  @override
  Stream<AppthemeState> mapEventToState(
    AppthemeEvent event,
  ) async* {
    if (event is AppThemeCheck) {
      if (service.checkTheme()) {
        yield AppThemeDark();
      } else {
        yield AppThemeLight();
      }
    } else if (event is AppThemeChage) {
      if (service.changetheme()) {
        yield AppThemeDark();
      } else {
        yield AppThemeLight();
      }
    }
  }
}
