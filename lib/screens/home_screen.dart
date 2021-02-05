import 'package:bitcoin_tracker/widget/current_price_widget.dart';
import 'package:bitcoin_tracker/widget/historical_price_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[700],
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Bitcoin Tracker',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.yellow,
                  ),
                ),
              ),
              HistoricalPriceWidget(),
              CurrentPriceWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
