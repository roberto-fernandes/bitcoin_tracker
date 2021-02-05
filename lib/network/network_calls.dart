import 'package:bitcoin_tracker/model/current_price.dart';
import 'package:bitcoin_tracker/model/historical_price.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<CurrentPrice> fetchCurrentPrice() async {
  final response =
      await http.get('https://api.coindesk.com/v1/bpi/currentprice.json');

  //statusCode 200 means OK response.
  if (response.statusCode == 200) {
    return CurrentPrice.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load price');
  }
}

Future<HistoricalPrice> fetchHistoricalPrize() async {
  final response =
      await http.get('https://api.coindesk.com/v1/bpi/historical/close.json');

  if (response.statusCode == 200) {
    return HistoricalPrice.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Faild to load historical price');
  }
}
