class ChatbotService {
  static String getReply(String message) {
    message = message.toLowerCase();

    // Greetings
    if (message.contains("hi") ||
        message.contains("hello") ||
        message.contains("hey")) {
      return "👋 Hello Farmer!\nHow can I help you today?";
    }

    // Paddy / Rice
    if (message.contains("rice") || message.contains("paddy")) {
      return "🌾 Paddy Advice:\n\n• Maintain 2–5 cm water level.\n• Apply Urea, DAP and Potash according to crop stage.\n• Watch for stem borer and leaf folder.";
    }

    // Tomato
    if (message.contains("tomato")) {
      return "🍅 Tomato Tips:\n\n• Water regularly.\n• Apply balanced NPK fertilizer.\n• Remove infected leaves.\n• Keep good sunlight.";
    }

    // Cotton
    if (message.contains("cotton")) {
      return "🌱 Cotton Tips:\n\n• Use well-drained soil.\n• Monitor pink bollworm.\n• Spray pesticides only when necessary.";
    }

    // Fertilizer
    if (message.contains("fertilizer")) {
      return "🌿 Always apply fertilizer based on soil test results.\nAvoid excessive fertilizer usage.";
    }

    // Disease
    if (message.contains("disease")) {
      return "🦠 Please open AI Crop Doctor and upload the crop image.\nThe AI will identify the disease.";
    }

    // Weather
    if (message.contains("weather")) {
      return "🌦 Please open the Weather module for live weather information.";
    }

    // Soil
    if (message.contains("soil")) {
      return "🌱 Soil Analysis helps determine pH, nutrients and fertilizer recommendations.";
    }

    // Market
    if (message.contains("market")) {
      return "📈 Market Prices module shows the latest crop prices.";
    }

    // Government
    if (message.contains("scheme")) {
      return "🏛 Check the Government Schemes section for subsidies and farmer welfare programs.";
    }

    // Irrigation
    if (message.contains("water") || message.contains("irrigation")) {
      return "💧 Irrigate early morning or evening to reduce water loss.";
    }

    // Telugu greeting
    if (message.contains("నమస్తే")) {
      return "🙏 నమస్తే రైతు గారు!\nమీకు ఎలా సహాయం చేయగలను?";
    }

    return "🤖 Sorry, I don't know the answer yet.\nThis feature will be improved with AI in the next version.";
  }
}
