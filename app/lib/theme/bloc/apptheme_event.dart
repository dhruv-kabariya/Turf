part of 'apptheme_bloc.dart';

@immutable
abstract class AppthemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppThemeChage extends AppthemeEvent {
  final bool value;
  AppThemeChage({@required this.value});
  @override
  List<Object> get props => [value];
}

class ThemeLoading extends AppthemeEvent {}
