part of 'stock_bloc.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();
}

class StockGetListEvent extends StockEvent {
  @override
  List<Object?> get props => [];
}
