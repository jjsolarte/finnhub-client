import 'package:finnhub_client/features/stock/model/stock_model.dart';
import 'package:finnhub_client/features/stock/service/stock_service.dart';

abstract class StockRepository {
  Future<List<StockModel>?> getStocks();
}

class StockRepositoryImpl implements StockRepository {
  StockRepositoryImpl({required this.stockService});

  final StockService stockService;

  @override
  Future<List<StockModel>?> getStocks() async {
    try {
      final response = await stockService.getStocks();
      if (response.isNotEmpty) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
