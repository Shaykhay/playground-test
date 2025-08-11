import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/chat_screen.dart';
import 'controllers/ui_controller.dart';

void main() {
  runApp(MyApp());
}
// thats all about it , pretty cool expeirence making a playground , did similar work before so it was easy , see yaah
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(UIController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile UI Playground',
      theme: ThemeData(

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey,
        ),
      ),
      home: PlaygroundView(),
    );
  }
}