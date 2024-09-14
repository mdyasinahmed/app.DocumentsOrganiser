import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'theme/colors.dart';

void main() {
  runApp(const DocumentsOrganiserApp());
}

class DocumentsOrganiserApp extends StatelessWidget {
  const DocumentsOrganiserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Remove the debug banner
      home: const HomePage(),             // HomePage as the main screen
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,  // Use the global theme color
        brightness: Brightness.light,          // Light theme for the app
      ),
    );
  }
}
