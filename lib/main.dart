import 'package:flutter/material.dart';
import 'src/welcome_screen.dart';
import 'src/themes/custom_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Estado para alternar entre tema claro e escuro

  /// Alterna o estado do tema global
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Cores fixas da AppBar
    const Color fixedAppBarColor = Color(0xFF8E2321);
    const Color fixedAppBarContentColor = Colors.white;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'This is Love',
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
        primaryColor: fixedAppBarColor,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: fixedAppBarColor,
          foregroundColor: fixedAppBarContentColor,
          iconTheme: IconThemeData(color: fixedAppBarContentColor),
          elevation: 0,
        ),
        cardColor: Colors.grey[800], // Cards cinza no modo escuro
        extensions: <ThemeExtension<dynamic>>[
          CustomColors.dark, // Paleta de cores escuras
        ],
      )
          : ThemeData.light().copyWith(
        primaryColor: Color(0xFFF5E1DA),
        scaffoldBackgroundColor: Color(0xFFF9F5F1),
        appBarTheme: AppBarTheme(
          backgroundColor: fixedAppBarColor,
          foregroundColor: fixedAppBarContentColor,
          iconTheme: IconThemeData(color: fixedAppBarContentColor),
          elevation: 4,
        ),
        cardColor: Colors.white, // Cards brancos no modo claro
        extensions: <ThemeExtension<dynamic>>[
          CustomColors.light, // Paleta de cores claras
        ],
      ),
      home: WelcomeScreen(toggleTheme: _toggleTheme),
    );
  }
}