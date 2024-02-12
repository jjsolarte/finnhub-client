import 'package:finnhub_client/features/alert/bloc/alert_bloc.dart';
import 'package:finnhub_client/features/stock/bloc/stock_bloc.dart';
import 'package:finnhub_client/features/trader/bloc/trader_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProviders {
  static final myProviders = [
    BlocProvider<AlertBloc>(create: (context) => AlertBloc()),
    BlocProvider<StockBloc>(create: (context) => StockBloc()),
    BlocProvider<TraderBloc>(create: (context) => TraderBloc()),
  ];
}
