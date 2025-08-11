import 'dart:convert';

class GeminiResponse {
  final String? rawText; // Original text from Gemini
  final String? title;
  final String? backgroundColor;
  final String? buttonColor;
  final String? nameFieldColor;
  final String? emailFieldColor;
  final String? error;

  GeminiResponse({
    this.rawText,
    this.title,
    this.backgroundColor,
    this.buttonColor,
    this.nameFieldColor,
    this.emailFieldColor,
    this.error,
  });

  factory GeminiResponse.fromJson(Map<String, dynamic> json) {
    try {
      final candidates = json["candidates"] as List?;
      if (candidates != null && candidates.isNotEmpty) {
        final parts = candidates[0]["content"]["parts"] as List?;
        if (parts != null && parts.isNotEmpty) {
          final text = parts[0]["text"] as String;

          // Remove triple backticks and "json" label
          final cleanedText = text
              .replaceAll(RegExp(r'```json', caseSensitive: false), '')
              .replaceAll('```', '')
              .trim();

          final layoutData = jsonDecode(cleanedText) as Map<String, dynamic>;

          return GeminiResponse(
            rawText: text,
            title: layoutData["title"],
            backgroundColor: layoutData["backgroundColor"],
            buttonColor: layoutData["buttonColor"],
            nameFieldColor: layoutData["nameFieldColor"],
            emailFieldColor: layoutData["emailFieldColor"],
          );
        }
      }
      return GeminiResponse(error: "No valid text found in Gemini response.");
    } catch (e) {
      return GeminiResponse(error: "Failed to parse Gemini response: $e");
    }
  }
}