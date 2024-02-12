import 'package:finnhub_client/features/alert/model/alert_model.dart';
import 'package:finnhub_client/ui/style/palette.dart';
import 'package:flutter/material.dart';

class AlertItemWidget extends StatelessWidget {
  const AlertItemWidget({Key? key, required this.alertModel}) : super(key: key);

  final AlertModel alertModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Value:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20,),
                Text(
                  '${alertModel.value.toString()} USD',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Share:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20,),
                Text(
                  alertModel.share,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
