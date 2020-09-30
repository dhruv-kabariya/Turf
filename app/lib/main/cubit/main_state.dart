part of 'main_cubit.dart';

@immutable
abstract class MainState extends Equatable {
  @override
  List<Object> get props => [];
}

class Ground extends MainState {
  final int i;

  Ground({@required this.i});
}

class Search extends MainState {
  final int i;

  Search({@required this.i});
}

class Bookmark extends MainState {
  final int i;

  Bookmark({@required this.i});
}

class Setting extends MainState {
  final int i;

  Setting({@required this.i});
}
