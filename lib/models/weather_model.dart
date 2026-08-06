class WeatherModel {
  final String city;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final String icon;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json["location"]["name"],
      temperature: json["current"]["temp_c"].toDouble(),
      description: json["current"]["condition"]["text"],
      humidity: json["current"]["humidity"],
      windSpeed: json["current"]["wind_kph"].toDouble(),
      icon: "https:${json["current"]["condition"]["icon"]}",
    );
  }
}
