import 'package:finnhub_client/features/stock/model/stock_model.dart';
import 'package:finnhub_client/ui/stock/ui/widget/stock_item.dart';
import 'package:flutter/material.dart';

class StockListWidget extends StatelessWidget {
  const StockListWidget({Key? key, required this.stockModelList})
      : super(key: key);

  final List<StockModel> stockModelList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: stockModelList.length,
        itemBuilder: (context, item) {
          return StockItemWidget(stockModel: stockModelList[item]);
        },
      ),
    );
  }
}
