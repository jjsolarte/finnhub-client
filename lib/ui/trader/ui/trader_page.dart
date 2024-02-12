import 'package:finnhub_client/features/trader/bloc/trader_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TraderPage extends StatefulWidget {
  const TraderPage({Key? key}) : super(key: key);

  @override
  State<TraderPage> createState() => _TraderPageState();
}

class _TraderPageState extends State<TraderPage> {
  late List<double> stockValueList = [];

  @override
  void initState() {
    context.read<TraderBloc>().add(TraderOpenChannelEvent());
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
              'BINANCE - Trade',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            BlocBuilder<TraderBloc, TraderState>(builder: (context, state) {
              if (state is TraderLoadedState) {
                stockValueList.add(state.data.p);
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: LineChart(
                        LineChartData(
                          titlesData: FlTitlesData(show: true),
                          borderData: FlBorderData(show: false),
                          axisTitleData: FlAxisTitleData(show: true),
                          gridData: FlGridData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              spots:
                                  stockValueList.asMap().entries.map((entry) {
                                return FlSpot(
                                    entry.key.toDouble(), entry.value);
                              }).toList(),
                              isCurved: true,
                              colors: [Colors.blue],
                              dotData: FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'BTCUSDT vs Time(s)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                        onPressed: () => context
                            .read<TraderBloc>()
                            .add(TradeCloseChannelEvent()),
                        child: const Text('Stop Subscription'))
                  ],
                );
              }
              return const Text(
                'Waiting data...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            }),
          ],
        ),
      ),
    );
  }
}
