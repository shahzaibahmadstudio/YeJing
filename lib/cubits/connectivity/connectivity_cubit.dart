import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yejing/cubits/connectivity/connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  late final StreamSubscription<InternetConnectionStatus> _subscription;

  ConnectivityCubit() : super(const ConnectedState()) {
    _startListening();
  }

  void _startListening() {
    _subscription = InternetConnectionChecker.instance.onStatusChange.listen((
      status,
    ) {
      if (status == InternetConnectionStatus.connected) {
        emit(const ConnectedState());
      } else {
        emit(const DisconnectedState());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
