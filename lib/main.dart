import 'package:flutter/material.dart';
import 'package:projeto_mvp/src/welcome_screen.dart';
import 'package:projeto_mvp/src/configuracoes_page.dart';
// Importa a classe de cores personalizadas (ajustado conforme sua especificação)
import 'src/custom_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Estado para o tema escuro

  // Função para alternar o tema entre claro e escuro
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value; // Alterna o estado do tema
    });
  }

  @override
  Widget build(BuildContext context) {
    // Definição das cores personalizadas para o tema claro
    const CustomColors lightCustomColors = CustomColors(
      titleColor: Colors.brown, // Cor para títulos no modo claro
      subtitleColor: Color(0xFF6B3916), // Cor para subtítulos no modo claro
      emailLinkColor: Colors.blueAccent, // Cor para links de e-mail no modo claro
      iconColor: Color(0xFF8E2321), // Cor para ícones no modo claro
      cardTitleColor: Colors.black87, // Cor para títulos dentro de cards no modo claro (escuro no card claro)
      cardSubtitleColor: Colors.black54, // Cor para subtítulos dentro de cards no modo claro (escuro no card claro)
      centerTextColor: Colors.brown, // Cor para texto central/geral no modo claro
    );

    // Definição das cores personalizadas para o modo escuro suave (ajustado conforme sua especificação)
    const CustomColors darkCustomColors = CustomColors(
      titleColor: Colors.white, // Cor para títulos no modo escuro
      subtitleColor: Colors.grey, // Cor para subtítulos no modo escuro
      emailLinkColor: Colors.blueAccent, // Cor para links de e-mail no modo escuro (ajustado para Colors.blueAccent)
      iconColor: Colors.red, // Cor para ícones no modo escuro (ajustado para Colors.red)
      cardTitleColor: Colors.black87, // Cor para títulos dentro de cards (escuro no card claro)
      cardSubtitleColor: Colors.black54, // Cor para subtítulos dentro de cards (escuro no card claro)
      centerTextColor: Colors.grey, // Cor para texto central/geral no modo escuro (ajustado para Colors.grey)
    );

    // Cor fixa para a AppBar em ambos os temas
    const Color fixedAppBarColor = Color(0xFF8E2321);
    // Cor fixa para o texto e ícones da AppBar em ambos os temas
    const Color fixedAppBarContentColor = Colors.white;

    return MaterialApp(
      title: 'This is Love',
      // Define o tema do aplicativo com base no estado _isDarkMode
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
        // Configurações para o tema escuro
        primaryColor: Color(0xFF8E2321), // Cor primária (pode não ser muito visível no modo escuro)
        scaffoldBackgroundColor: Colors.grey[900], // Fundo da tela escuro
        appBarTheme: AppBarTheme(
          // AppBar com cor fixa no modo escuro
          backgroundColor: fixedAppBarColor,
          foregroundColor: fixedAppBarContentColor, // Cor do texto e ícones fixos
          iconTheme: IconThemeData(color: fixedAppBarContentColor), // Cor dos ícones fixos
          elevation: 0, // Sem sombra na AppBar
        ),
        cardColor: Colors.white, // Cards SEMPRE claros no modo escuro
        extensions: <ThemeExtension<dynamic>>[ // Adiciona a extensão de cores personalizadas para o modo escuro
          darkCustomColors,
        ],
      )
          : ThemeData(
        // Configurações para o tema claro
        primaryColor: Color(0xFFF5E1DA), // Cor primária
        scaffoldBackgroundColor: Color(0xFFF9F5F1), // Fundo da tela claro
        appBarTheme: AppBarTheme(
          // AppBar com cor fixa no modo claro
          backgroundColor: fixedAppBarColor,
          foregroundColor: fixedAppBarContentColor, // Cor do texto e ícones fixos
          iconTheme: IconThemeData(color: fixedAppBarContentColor), // Cor dos ícones fixos
          elevation: 4, // Sombra na AppBar
        ),
        cardColor: Colors.white, // Cards SEMPRE claros no modo claro
        extensions: <ThemeExtension<dynamic>>[ // Adiciona a extensão de cores personalizadas para o modo claro
          lightCustomColors,
        ],
      ),
      // Define a tela inicial do aplicativo
      // Passa a função _toggleTheme para WelcomeScreen
      home: WelcomeScreen(toggleTheme: _toggleTheme),
    );
  }
}
