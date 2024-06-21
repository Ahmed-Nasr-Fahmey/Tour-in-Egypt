import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApiService {
  static String? apiKey = dotenv.env['WEATHER_API_KEY'];
  static String baseUrl = 'http://api.weatherapi.com/v1/current.json?';

  static Future<Map<String, dynamic>> getCityWeather(
      {required String cityName}) async {
    Uri url = Uri.parse('${baseUrl}key=$apiKey&q=$cityName&aqi=no');
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
