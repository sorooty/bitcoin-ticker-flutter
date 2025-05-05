// File that contains my API model :

class Exchangerate {
  final String base;
  final String quote;
  final double rate;

  Exchangerate({required this.base, required this.quote, required this.rate});

  factory Exchangerate.fromJson(Map<String, dynamic> json) {
    return Exchangerate(
      base: json['asset_id_base'],
      quote: json['asset_id_quote'],
      rate: json['rate'].toDouble(),
    );
  }

}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {}
