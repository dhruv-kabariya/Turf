part of 'apptheme_bloc.dart';

@immutable
abstract class AppthemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppThemeChage extends AppthemeEvent {}

class AppThemeCheck extends AppthemeEvent {}
