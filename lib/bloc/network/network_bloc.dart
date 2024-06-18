
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplemessage/bloc/network/network_event.dart';
import 'package:simplemessage/bloc/network/network_state.dart';
import 'package:simplemessage/model/networkhelper.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
      emit(
    state.copyWith(isConnected: event.isConnected),
    );
  }
}