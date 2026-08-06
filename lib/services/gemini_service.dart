import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey = "API KEY1";

  static Future<String> askAI(String question) async {
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/interactions",
    );

    try {
      final response = await http.post(
        url,
        headers: {"x-goog-api-key": apiKey, "Content-Type": "application/json"},
        body: jsonEncode({
          "model": "gemini-3.6-flash",
          "input":
              "You are an AI farming assistant. Answer only agriculture-related questions in simple language.\n\nQuestion: $question",
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data["output"] ?? "No response received from Gemini.";
      } else {
        return "Gemini Error ${response.statusCode}\n${response.body}";
      }
    } catch (e) {
      return "Network Error\n$e";
    }
  }
}
