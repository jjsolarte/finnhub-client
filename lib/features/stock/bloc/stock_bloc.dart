import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:finnhub_client/features/stock/model/stock_model.dart';
import 'package:finnhub_client/features/stock/repository/stock_repository.dart';
import 'package:finnhub_client/features/stock/service/stock_service.dart';

part 'stock_event.dart';

part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockRepository stockRepository =
      StockRepositoryImpl(stockService: StockServiceImpl(dio: Dio()));

  StockBloc() : super(StockInitial()) {
    on<StockGetListEvent>((event, emit) async {
      emit(StockLoadingState());
      final stockList = await stockRepository.getStocks();
      if (stockList != null) {
        emit(StockLoadedState(stockModelList: stockList));
      } else {
        emit(StockFailureState());
      }
    });
  }
}
