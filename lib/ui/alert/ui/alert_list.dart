import 'package:finnhub_client/features/alert/model/alert_model.dart';
import 'package:finnhub_client/ui/alert/ui/alert_item.dart';
import 'package:flutter/material.dart';

class AlertListWidget extends StatelessWidget {
  const AlertListWidget({Key? key, required this.alertModelList})
      : super(key: key);

  final List<AlertModel> alertModelList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: alertModelList.length,
        itemBuilder: (context, item) {
          return AlertItemWidget(alertModel: alertModelList[item]);
        });
  }
}
