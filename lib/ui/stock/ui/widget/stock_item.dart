import 'package:finnhub_client/features/stock/model/stock_model.dart';
import 'package:finnhub_client/ui/style/palette.dart';
import 'package:flutter/material.dart';

class StockItemWidget extends StatelessWidget {
  const StockItemWidget({Key? key, required this.stockModel}) : super(key: key);

  final StockModel stockModel;

  @override
  Widget build(BuildContext context) {
    double pricePercent =
        stockModel.currentPrice / stockModel.previousClosePrice;
    return Card(
      elevation: 0.6,
      color: Palette.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${stockModel.currentPrice.toString()} USD',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${(pricePercent).toStringAsFixed(3)} %',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: pricePercent == 0
                          ? Colors.white
                          : pricePercent > 0
                              ? Colors.green
                              : Colors.red),
                ),
                pricePercent == 0
                    ? const Icon(
                        Icons.circle_outlined,
                        color: Colors.white,
                      )
                    : pricePercent > 0
                        ? const Icon(
                            Icons.keyboard_double_arrow_up,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.keyboard_double_arrow_down,
                            color: Colors.red,
                          )
              ],
            ),
            Text(
              stockModel.tickerSymbol,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
