import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finnhub_client/core/constants/api_constants.dart';
import 'package:finnhub_client/features/trader/model/trade_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'trader_event.dart';

part 'trader_state.dart';

class TraderBloc extends Bloc<TraderEvent, TraderState> {
  late WebSocketChannel channel;

  TraderBloc() : super(TraderInitial()) {
    on<TraderOpenChannelEvent>((event, emit) async {
      channel = WebSocketChannel.connect(
        Uri.parse('wss://ws.finnhub.io?token=${ApiConstants.apiKey}'),
      );
      emit(const TraderLoadingState(null));
      try {
        channel.sink.add('{"type":"subscribe","symbol":"BINANCE:BTCUSDT"}');
        emitStateLoaded();
      } catch (e) {
        rethrow;
      }
    });
    on<TradeCloseChannelEvent>((event, emit) async {
      channel.sink.close();
    });
  }

  void emitStateLoaded() {
    channel.stream.listen((stream) async {
      final trade =
          TradeModelList.fromJson(jsonDecode(stream) as Map<String, dynamic>);
      emit(TraderLoadedState(data: trade.data.first));
    });
  }
}
