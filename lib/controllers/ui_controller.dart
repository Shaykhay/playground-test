import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/gemini_response_model.dart';
import '../services/gemini_service.dart';

class UIController extends GetxController {
  var title = "My Profile".obs;
  Rx<Color> backgroundColor = Rx<Color>(Colors.lightBlue);//this is to controll the color scheme on the entire playground app of the app
  Rx<Color> buttonColor = Rx<Color>(Colors.blueAccent);
  Rx<Color> nameFieldColor = Rx<Color>(Colors.white);
  Rx<Color> emailFieldColor = Rx<Color>(Colors.white);

  final GeminiService _geminiService = GeminiService();

  void applyLayout(GeminiResponse response) {
    // Assuming your GeminiResponse has a `title`, `backgroundColor`, etc.
    try {
      if (response.title != null) {
        title.value = response.title!;
      }
      if (response.backgroundColor != null) {
        backgroundColor.value = _parseColor(response.backgroundColor!);
      }
      if (response.buttonColor != null) {
        buttonColor.value = _parseColor(response.buttonColor!);
      }
      if (response.nameFieldColor != null) {
        nameFieldColor.value = _parseColor(response.nameFieldColor!);
      }
      if (response.emailFieldColor != null) {
        emailFieldColor.value = _parseColor(response.emailFieldColor!);
      }
    } catch (e) {
      print("error");
      print(e);
    }
  }

  Color _parseColor(String colorName) {
    switch (colorName.toLowerCase().replaceAll(' ', '')) {
      case "red":
        return Colors.red;
      case "redaccent":
        return Colors.redAccent;
      case "pink":
        return Colors.pink;
      case "pinkaccent":
        return Colors.pinkAccent;
      case "purple":
        return Colors.purple;
      case "purpleaccent":
        return Colors.purpleAccent;
      case "deeppurple":
        return Colors.deepPurple;
      case "deeppurpleaccent":
        return Colors.deepPurpleAccent;
      case "indigo":
        return Colors.indigo;
      case "indigoaccent":
        return Colors.indigoAccent;
      case "blue":
        return Colors.blue;
      case "blueaccent":
        return Colors.blueAccent;
      case "lightblue":
        return Colors.lightBlue;
      case "lightblueaccent":
        return Colors.lightBlueAccent;
      case "cyan":
        return Colors.cyan;
      case "cyanaccent":
        return Colors.cyanAccent;
      case "teal":
        return Colors.teal;
      case "tealaccent":
        return Colors.tealAccent;
      case "green":
        return Colors.green;
      case "greenaccent":
        return Colors.greenAccent;
      case "lightgreen":
        return Colors.lightGreen;
      case "lightgreenaccent":
        return Colors.lightGreenAccent;
      case "lime":
        return Colors.lime;
      case "limeaccent":
        return Colors.limeAccent;
      case "yellow":
        return Colors.yellow;
      case "yellowaccent":
        return Colors.yellowAccent;
      case "amber":
        return Colors.amber;
      case "amberaccent":
        return Colors.amberAccent;
      case "orange":
        return Colors.orange;
      case "orangeaccent":
        return Colors.orangeAccent;
      case "deeporange":
        return Colors.deepOrange;
      case "deeporangeaccent":
        return Colors.deepOrangeAccent;
      case "brown":
        return Colors.brown;
      case "grey":
      case "gray":
        return Colors.grey;
      case "bluegrey":
        return Colors.blueGrey;
      case "white":
        return Colors.white;
      case "black":
        return Colors.black;
      case "transparent":
        return Colors.transparent;
      default:
        return Colors.transparent;
    }//all the colors are sorted and returned accordingly
  }

  Future<void> handleUserPrompt(String prompt) async {
    if (prompt.toLowerCase() == "reset") {
      resetUI();
      return;
    }
    try {
      final layout = await _geminiService.getLayoutFromPrompt(prompt);
      if (layout != null) {
        applyLayout(layout);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void resetUI() {
    title.value = "My Profile";
    backgroundColor.value = Colors.lightBlue;
    buttonColor.value = Colors.blueAccent;
    nameFieldColor.value = Colors.white;
    emailFieldColor.value = Colors.white;
  }
}