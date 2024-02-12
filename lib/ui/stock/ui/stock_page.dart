import 'package:finnhub_client/features/stock/bloc/stock_bloc.dart';
import 'package:finnhub_client/ui/stock/ui/widget/stock_list.dart';
import 'package:finnhub_client/ui/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  void initState() {
    context.read<StockBloc>().add(StockGetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Share Info',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<StockBloc, StockState>(builder: (context, state) {
              if (state is StockLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Palette.primaryColor,
                ));
              }
              if (state is StockFailureState) {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'So sorry, we cant list stocks',
                    style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 22,
                    ),
                  ),
                );
              }
              if (state is StockLoadedState) {
                return StockListWidget(
                  stockModelList: state.stockModelList,
                );
              }
              return const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Downloading stock info...',
                  style: TextStyle(
                    color: Palette.primaryText,
                    fontSize: 22,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
