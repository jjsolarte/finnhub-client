import 'package:finnhub_client/features/alert/bloc/alert_bloc.dart';
import 'package:finnhub_client/ui/alert/ui/alert_list.dart';
import 'package:finnhub_client/ui/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertManagerWidget extends StatelessWidget {
  const AlertManagerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertBloc, AlertState>(builder: (context, state) {
      if (state is LoadingState) {
        return const Center(
            child: CircularProgressIndicator(
          color: Palette.primaryColor,
        ));
      }
      if (state is ErrorState) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'So sorry, we cant list commits',
            style: TextStyle(
              color: Palette.primaryColor,
              fontSize: 22,
            ),
          ),
        );
      }
      if (state is LoadedState) {
        return AlertListWidget(alertModelList: state.alerts);
      }
      return const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'You dont have alerts yet',
          style: TextStyle(
            color: Palette.primaryText,
            fontSize: 22,
          ),
        ),
      );
    });
  }
}
