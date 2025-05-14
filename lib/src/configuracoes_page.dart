import 'package:flutter/material.dart';
import 'themes/custom_colors.dart';

class ConfiguracoesPage extends StatelessWidget {
  final Function(bool) toggleTheme; // Função para alternar o tema

  // Construtor que recebe a função toggleTheme
  ConfiguracoesPage({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Acessa o tema atual e a extensão de cores personalizadas
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;

    // Cores do tema padrão (AppBar, Fundo do Scaffold)
    final appBarTheme = theme.appBarTheme;
    final scaffoldBackgroundColor = theme.scaffoldBackgroundColor;

    // Cores personalizadas da extensão (para texto e ícones)
    final listTileTitleColor = customColors.subtitleColor!;
    final listTileSubtitleColor = customColors.centerTextColor!;
    final listTileIconColor = customColors.iconColor!;

    // Determina o estado atual do tema
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: TextStyle(
            color: appBarTheme.foregroundColor!,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        backgroundColor: appBarTheme.backgroundColor!,
        iconTheme: IconThemeData(color: appBarTheme.iconTheme!.color!),
        elevation: appBarTheme.elevation ?? 4,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.palette, color: listTileIconColor),
            title: Text('Tema do aplicativo', style: TextStyle(color: listTileTitleColor)),
            subtitle: Text('Escolha entre claro e escuro.', style: TextStyle(color: listTileSubtitleColor)),
            trailing: Switch(
              value: isDarkMode,
              onChanged: toggleTheme,
              activeColor: Color(0xFF8E2321), // Cor ativa do switch
            ),
          ),
        ],
      ),
    );
  }
}
