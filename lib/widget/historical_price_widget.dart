import 'package:bitcoin_tracker/model/historical_price.dart';
import 'package:bitcoin_tracker/network/network_calls.dart';
import 'package:bitcoin_tracker/widget/history_chart.dart';
import 'package:flutter/material.dart';

class HistoricalPriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HistoricalPrice>(
      future: fetchHistoricalPrize(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 40, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 8),
                  child: Text(
                    'Historical Value:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                HistoryChart(snapshot.data),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
