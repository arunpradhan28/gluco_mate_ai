// import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';


// class GeminiService {
//   static const _apiKey = 'AIzaSyAEil5kw-ORkgowEf0WEU9-BiGb184Z-u8'; // Replace with your Gemini API key

//   static Future<String> getAiSuggestions(List<SugarLogModel> logs) async {
//     try {
//       final model = GenerativeModel(model: 'gemini-pro', apiKey: _apiKey);

//       final prompt = _generatePrompt(logs);
//       final response = await model.generateContent([Content.text(prompt)]);

//       return response.text ?? 'No suggestions generated.';
//     } catch (e) {
//       return 'Gemini Error: $e';
//     }
//   }

//   static String _generatePrompt(List<SugarLogModel> logs) {
//     final buffer = StringBuffer();
//     buffer.writeln('Based on the following sugar logs, provide healthy lifestyle and dietary recommendations:');
//     for (var log in logs) {
//       buffer.writeln(
//         '• ${log.type} - ${log.sugarLevel} mg/dL at ${log.timestamp}',
//       );
//     }
//     return buffer.toString();
//   }
// }
import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';


class GeminiService {
  static const _apiKey = 'AIzaSyAEil5kw-ORkgowEf0WEU9-BiGb184Z-u8'; // 🔐 Replace with your real API key

  static Future<String> getAiSuggestions(List<SugarLogModel> logs) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: _apiKey,
      );

      final prompt = _generatePrompt(logs);
      final response = await model.generateContent([
        Content.text(prompt),
      ]);

      if (response.text == null || response.text!.isEmpty) {
        print("🛑 Gemini returned empty response.");
        return 'No suggestions returned by Gemini.';
      }

      return response.text!;
    } catch (e, stackTrace) {
      print("❌ Gemini API Error: $e");
      print("🔍 Stack Trace:\n$stackTrace");
      return 'Gemini Error: $e';
    }
  }

  static String _generatePrompt(List<SugarLogModel> logs) {
    final buffer = StringBuffer();
    buffer.writeln('You are a diabetes assistant AI. Analyze the sugar levels below and provide actionable suggestions.');
    for (var log in logs) {
      buffer.writeln('• ${log.type}: ${log.sugarLevel} mg/dL at ${log.timestamp}');
    }
    return buffer.toString();
  }
}
