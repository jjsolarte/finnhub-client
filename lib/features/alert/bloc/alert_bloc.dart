import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finnhub_client/features/alert/model/alert_model.dart';

part 'alert_event.dart';

part 'alert_state.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  final List<AlertModel> shares = [];

  AlertBloc() : super(AlertInitial()) {
    on<AlertAddAlertEvent>((event, emit) async {
      emit(AlertInitial());
      shares.add(event.alertModel);
      emit(LoadedState(alerts: shares));
    });
  }
}
