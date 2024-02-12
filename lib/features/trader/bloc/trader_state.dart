part of 'trader_bloc.dart';

abstract class TraderState extends Equatable {
  const TraderState();
}

class TraderInitial extends TraderState {
  @override
  List<Object> get props => [];
}

class TraderLoadingState extends TraderState {
  final TradeModel? data;

  const TraderLoadingState(this.data);

  @override
  List<Object?> get props => [data];
}

class TraderFailureState extends TraderState {
  @override
  List<Object?> get props => [];
}

class TraderLoadedState extends TraderState {
  const TraderLoadedState({required this.data});

  final TradeModel data;

  @override
  List<Object?> get props => [data];
}
