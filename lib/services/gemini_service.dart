import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/gemini_response_model.dart';

class GeminiService {
  final String apiKey = "Use your api key for gemini 2.5 pro model";

  Future<GeminiResponse> getLayoutFromPrompt(String prompt) async {
    final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1/models/gemini-2.5-pro:generateContent?key=$apiKey");

    final body = {
      "contents": [
        {
          "parts": [
            {
              "text":
              "You are a UI layout generator. Convert this user request into a JSON object with these keys: title, backgroundColor, buttonColor, nameFieldColor, emailFieldColor. Use simple color names. User request: $prompt"
            }
          ]
        }
      ]
    };

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        print(data);
        return GeminiResponse.fromJson(data);
      } catch (e) {
        return GeminiResponse(error: "Output was not JSON. Returning as text: ${response.body}");
      }
    } else {
      return GeminiResponse(error: "API call failed: ${response.statusCode} - ${response.body}");
    }
  }
  }