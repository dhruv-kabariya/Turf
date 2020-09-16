part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Cheking extends NetworkEvent {}
