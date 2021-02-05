import 'package:bitcoin_tracker/model/current_price.dart';
import 'package:bitcoin_tracker/network/network_calls.dart';
import 'package:flutter/material.dart';

class CurrentPriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CurrentPrice>(
      future: fetchCurrentPrice(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The current Bitcoin price is:',
                  style: TextStyle(color: Colors.white),
                ),
                Text('\$' + snapshot.data.bpi.usd.rate,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 40,
                    )),
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
