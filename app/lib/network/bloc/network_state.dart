part of 'network_bloc.dart';

@immutable
abstract class NetworkState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NetworkInitial extends NetworkState {}

class NetworkConnected extends NetworkState {
  final String connection;
  NetworkConnected({@required this.connection});
  @override
  List<Object> get props => [connection];
}

class NetworkError extends NetworkState {
  static const String message = "No Connection";
}
