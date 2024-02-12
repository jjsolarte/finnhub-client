part of 'alert_bloc.dart';

abstract class AlertState extends Equatable {
  const AlertState();
}

class AlertInitial extends AlertState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AlertState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends AlertState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends AlertState {
  const LoadedState({required this.alerts});

  final List<AlertModel> alerts;

  @override
  List<Object?> get props => [alerts];
}
