part of 'alert_bloc.dart';

abstract class AlertEvent extends Equatable {
  const AlertEvent();
}

class AlertAddAlertEvent extends AlertEvent {
  const AlertAddAlertEvent({required this.alertModel});

  final AlertModel alertModel;

  @override
  List<Object?> get props => [alertModel];
}
