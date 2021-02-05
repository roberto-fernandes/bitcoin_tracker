import 'package:bitcoin_tracker/model/time.dart';

class HistoricalPrice {
  Time time;
  Map<String, dynamic> bpi;

  HistoricalPrice({this.time, this.bpi});

  HistoricalPrice.fromJson(Map<String, dynamic> json) {
    bpi = json['bpi'];
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
  }
}
