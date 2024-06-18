

import 'package:equatable/equatable.dart';


class NetworkState  extends Equatable  {
  final bool isConnected;
  const NetworkState({this.isConnected = false});

  NetworkState copyWith({bool? isConnected}) {
    return NetworkState(
        isConnected: isConnected ?? this.isConnected
    );
  }

  @override
  List<Object> get props => [isConnected];
}

class NetworkInitial extends NetworkState {}
