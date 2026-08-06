import 'package:flutter/material.dart';

import '../../utils/language.dart';
import '../../widgets/feature_card.dart';
import '../../widgets/weather_card.dart';

import '../crop_doctor/crop_doctor_screen.dart';
import '../chatbot/chatbot_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF4),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          isTelugu ? "స్మార్ట్ రైతు సహాయకుడు" : "Smart Farmer Assistant",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isTelugu ? "శుభ సాయంత్రం రైతు గారు 👋" : "Good Evening 👋",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text(
              isTelugu
                  ? "స్మార్ట్ రైతు సహాయక యాప్‌కు స్వాగతం"
                  : "Welcome to Smart Farmer Assistant",
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 20),

            const WeatherCard(),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.05,
                children: [
                  // AI Crop Doctor
                  FeatureCard(
                    icon: Icons.health_and_safety,
                    title: isTelugu
                        ? "AI పంట\nవ్యాధి నిర్ధారణ"
                        : "AI Crop Doctor",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CropDoctorScreen(),
                        ),
                      );
                    },
                  ),

                  // Weather
                  FeatureCard(
                    icon: Icons.cloud,
                    title: isTelugu ? "వాతావరణం" : "Weather",
                    onTap: () {},
                  ),

                  // Soil Analysis
                  FeatureCard(
                    icon: Icons.grass,
                    title: isTelugu ? "నేల\nవిశ్లేషణ" : "Soil Analysis",
                    onTap: () {},
                  ),

                  // Crop Recommendation
                  FeatureCard(
                    icon: Icons.agriculture,
                    title: isTelugu ? "పంట\nసిఫార్సు" : "Crop Recommendation",
                    onTap: () {},
                  ),

                  // Market Prices
                  FeatureCard(
                    icon: Icons.show_chart,
                    title: isTelugu ? "మార్కెట్\nధరలు" : "Market Prices",
                    onTap: () {},
                  ),

                  // AI Chatbot
                  FeatureCard(
                    icon: Icons.smart_toy,
                    title: isTelugu ? "AI\nసహాయకుడు" : "AI Chatbot",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ChatbotScreen(),
                        ),
                      );
                    },
                  ),

                  // Farm Diary
                  FeatureCard(
                    icon: Icons.book,
                    title: isTelugu ? "వ్యవసాయ\nడైరీ" : "Farm Diary",
                    onTap: () {},
                  ),

                  // Government Schemes
                  FeatureCard(
                    icon: Icons.account_balance,
                    title: isTelugu ? "ప్రభుత్వ\nపథకాలు" : "Govt Schemes",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
