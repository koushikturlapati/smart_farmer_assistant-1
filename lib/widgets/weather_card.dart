import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../utils/language.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModel>(
      future: WeatherService().getWeather(),
      builder: (context, snapshot) {
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 190,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }

        // Error
        if (snapshot.hasError) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          );
        }

        // No data
        if (!snapshot.hasData) {
          return Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                "No Weather Data",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        final weather = snapshot.data!;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green.shade700,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isTelugu ? "నేటి వాతావరణం" : "Today's Weather",
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Image.network(
                    weather.icon,
                    width: 60,
                    height: 60,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.cloud, color: Colors.white, size: 60),
                  ),

                  const SizedBox(width: 15),

                  Text(
                    "${weather.temperature.toStringAsFixed(1)}°C",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                "${weather.description} • ${weather.city}",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "💧 ${weather.humidity}%",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "💨 ${weather.windSpeed.toStringAsFixed(1)} m/s",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                "🤗 ${isTelugu ? "అనిపించే ఉష్ణోగ్రత" : "Feels Like"}: ${weather.feelsLike.toStringAsFixed(1)}°C",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        );
      },
    );
  }
}
