import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:weather_application/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService{
  static const BASE_URL = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
   var url = "$BASE_URL?q=$cityName&appid=$apiKey&units=metric";
   final response = await http.get(Uri.parse(url));

   if(response.statusCode == 200){
     return Weather.fromJson(jsonDecode(response.body));
   }else{
     throw Exception('Failed to load weather');
   }
  }

  Future<String> getCurrentCity(){
    locationPermission = await Geolocator.checkPermission();

  }
}