class weather_model {
  private final String cityName;
  private final double temperature;
  private final String mainCondition;

  public weather_model(String cityName, double temperature, String mainCondition) {
    this.cityName = cityName;
    this.temperature = temperature;
    this.mainCondition = mainCondition;
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }

}
