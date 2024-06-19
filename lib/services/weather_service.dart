import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:your_app/models/weather_model.dart';

class WeatherService {
    static const String BASE_URL = "http://api.openweathermap.org/data/2.5/weather";
    final String apiKey;

    WeatherService(this.apiKey);

    Future<Weather> getWeather(String cityName) async {
        final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

        if (response.statusCode == 200) {
            return Weather.fromJson(jsonDecode(response.body));
        } else {
            throw Exception('OOPS! Failed to load data');
        }
    }

    Future<String> getCurrentCity() async {

        //get location permissions
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
                throw Exception('Location permissions are denied');
            }
        }
        //get current position permissions
        Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);

        //convert the location into a list of placemark locations
        List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

        //extract the city name
        String? city = placemarks[0].locality;
        return city ?? "";
    }
}
