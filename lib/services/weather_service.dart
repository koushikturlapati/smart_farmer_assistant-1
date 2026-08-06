import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  static const String apiKey = "d220bd55e5e74430bbc183105260408";

  Future<WeatherModel> getWeather(String city) async {
    try {
      final url = Uri.parse(
        "https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no",
      );

      print("URL: $url");

      final response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );

      print("Status Code: ${response.statusCode}");
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      }

      throw Exception("HTTP ${response.statusCode}\n${response.body}");
    } catch (e) {
      print("Weather Error: $e");
      rethrow;
    }
  }
}
