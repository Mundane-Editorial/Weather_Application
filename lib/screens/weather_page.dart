import 'package:flutter/material.dart';

import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  //api key
  final _weatherService = WeatherService('efed3c28909ecd2609d74dae279111e5');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async{
    //get current city
    String cityName = await _weatherService.getCurrentCity();

    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }catch(e){
      print(e);
    }
  }
  //weather animation

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
