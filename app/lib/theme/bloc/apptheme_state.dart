part of 'apptheme_bloc.dart';

class AppthemeState extends Equatable {
  final ThemeMode theme;
  AppthemeState({@required this.theme});
  @override
  List<Object> get props => [theme];
}
