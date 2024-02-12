import 'package:dio/dio.dart';
import 'package:finnhub_client/core/constants/stock_list.dart';
import 'package:finnhub_client/features/stock/model/stock_model.dart';
import '../../../core/constants/api_constants.dart';

abstract class StockService {
  Future<List<StockModel>> getStocks();
}

class StockServiceImpl implements StockService {
  StockServiceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<StockModel>> getStocks() async {
    final List<StockModel> stockList = [];
    try {
      for (String stock in StocksList.stocksList) {
        String endPoint =
            '${ApiConstants.baseUrl}/api/v1/quote?symbol=$stock&token=${ApiConstants.apiKey}';
        final res =
            await dio.get(endPoint).timeout(const Duration(seconds: 60));
        final stockInfo = StockModel.fromJson(stock, res.data as Map<String, dynamic>);
        stockList.add(stockInfo);
      }
      return stockList;
    } catch (e) {
      rethrow;
    }
  }
}
