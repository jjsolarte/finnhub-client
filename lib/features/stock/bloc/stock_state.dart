part of 'stock_bloc.dart';

abstract class StockState extends Equatable {
  const StockState();
}

class StockInitial extends StockState {
  @override
  List<Object> get props => [];
}

class StockLoadingState extends StockState {
  @override
  List<Object?> get props => [];
}

class StockFailureState extends StockState {
  @override
  List<Object?> get props => [];
}

class StockLoadedState extends StockState {
  const StockLoadedState({required this.stockModelList});

  final List<StockModel> stockModelList;

  @override
  List<Object?> get props => [stockModelList];
}
