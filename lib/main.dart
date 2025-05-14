import 'package:flutter/material.dart';
import 'package:projeto_mvp/src/welcome_screen.dart';
import 'package:projeto_mvp/src/configuracoes_page.dart';
import 'src/custom_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // aqui eu controlo se tá no modo escuro ou não

  // função que troca o tema quando o usuário ativa/desativa o switch
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // cores que eu uso quando o tema tá claro
    const CustomColors lightCustomColors = CustomColors(
      titleColor: Colors.brown,
      subtitleColor: Color(0xFF6B3916),
      emailLinkColor: Colors.blueAccent,
      iconColor: Color(0xFF8E2321),
      cardTitleColor: Colors.black87,
      cardSubtitleColor: Colors.black54,
      centerTextColor: Colors.brown,
    );

    // cores que eu uso quando o tema tá escuro
    const CustomColors darkCustomColors = CustomColors(
      titleColor: Colors.white,
      subtitleColor: Colors.grey,
      emailLinkColor: Colors.blueAccent,
      iconColor: Colors.red,
      cardTitleColor: Colors.black87,
      cardSubtitleColor: Colors.black54,
      centerTextColor: Colors.grey,
    );

    // cor padrão da AppBar (mesma pro tema claro e escuro)
    const Color fixedAppBarColor = Color(0xFF8E2321);
    const Color fixedAppBarContentColor = Colors.white;

    return MaterialApp(
      title: 'This is Love',
      debugShowCheckedModeBanner: false, // tira aquele banner "DEBUG" do canto da tela
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
              primaryColor: Color(0xFF8E2321),
              scaffoldBackgroundColor: Colors.grey[900],
              appBarTheme: AppBarTheme(
                backgroundColor: fixedAppBarColor,
                foregroundColor: fixedAppBarContentColor,
                iconTheme: IconThemeData(color: fixedAppBarContentColor),
                elevation: 0,
              ),
              cardColor: Colors.white, // deixo os cards sempre claros
              extensions: <ThemeExtension<dynamic>>[
                darkCustomColors,
              ],
            )
          : ThemeData(
              primaryColor: Color(0xFFF5E1DA),
              scaffoldBackgroundColor: Color(0xFFF9