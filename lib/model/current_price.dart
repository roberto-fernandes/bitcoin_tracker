import 'package:bitcoin_tracker/model/time.dart';

class CurrentPrice {
  Time time;
  Bpi bpi;

  CurrentPrice.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    bpi = json['bpi'] != null ? Bpi.fromJson(json['bpi']) : null;
  }
}

class Bpi {
  Currency usd;
  Currency gbp;
  Currency eur;

  Bpi({this.usd, this.gbp, this.eur});

  Bpi.fromJson(Map<String, dynamic> json) {
    usd = json['USD'] != null ? Currency.fromJson(json['USD']) : null;
    gbp = json['GBP'] != null ? Currency.fromJson(json['GBP']) : null;
    eur = json['EUR'] != null ? Currency.fromJson(json['EUR']) : null;
  }
}

class Currency {
  String rate;

  Currency({this.rate});

  Currency.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
  }
}
