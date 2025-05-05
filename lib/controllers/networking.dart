import 'dart:convert';
import 'package:bitcoin_ticker/models/coin_data.dart';
import 'package:http/http.dart' as http;
// import 'chemin vers le fichier du "model" '; // your model

class ApiService {
  static const String _apiKey = 'cf44a9cc-7b4d-40fe-8147-f9e3365c5eed';
  static const String _baseUrl = 'https://rest.coinapi.io/v1/exchangerate';

  Future<Exchangerate> getExchangeRate(String base, String quote) async {
    final url = Uri.parse('$_baseUrl/$base/$quote');
    final response = await http.get(url, headers: {
      'X-CoinAPI-Key': _apiKey,
    });

    if (response.statusCode == 200) {
      return Exchangerate.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
