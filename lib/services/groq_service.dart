import 'dart:convert';
import 'package:http/http.dart' as http;

class GroqService {
  static const String apiKey = "API KEY";

  static Future<String> askAI(String question) async {
    final url = Uri.parse("https://api.groq.com/openai/v1/chat/completions");

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "llama-3.3-70b-versatile",
        "messages": [
          {
            "role": "system",
            "content":
                "You are an expert AI Farming Assistant for Indian farmers. "
                "Answer only agriculture-related questions in simple English. "
                "Topics include crops, fertilizers, irrigation, diseases, weather, soil, market prices, and government schemes.",
          },
          {"role": "user", "content": question},
        ],
        "temperature": 0.7,
        "max_tokens": 500,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["choices"][0]["message"]["content"];
    } else {
      return "Error ${response.statusCode}\n${response.body}";
    }
  }
}
