import 'package:equatable/equatable.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object?> get props => [];
}

class ConnectedState extends ConnectivityState {
  const ConnectedState();
}

class DisconnectedState extends ConnectivityState {
  const DisconnectedState();
}
