import 'package:flutter/material.dart';
import 'package:projeto_mvp/src/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is Love',
      theme: ThemeData(
        primaryColor: Color(0xFFF5E1DA),
        scaffoldBackgroundColor: Color(0xFFFFFBF7),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
      ),
      home: WelcomeScreen(), // ✅ Aqui está a alteração principal
      debugShowCheckedModeBanner: false,
    );
  }
}
