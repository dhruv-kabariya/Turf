part of 'apptheme_bloc.dart';

@immutable
abstract class AppthemeState {}

class AppThemeDark extends AppthemeState {
  final ThemeData themeData = AppTheme.dark;
}

class AppThemeLight extends AppthemeState {
  final ThemeData themeData = AppTheme.light;
}
