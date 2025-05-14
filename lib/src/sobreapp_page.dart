import 'package:flutter/material.dart';
// Importa as cores personalizadas do mesmo diretório
import 'custom_colors.dart';

class SobreAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Acessa o tema atual e a extensão de cores personalizadas
    final theme = Theme.of(context);
    // Certifica que a extensão CustomColors foi adicionada ao ThemeData no seu main.dart
    final customColors = theme.extension<CustomColors>()!;

    // Cores do tema padrão (AppBar, Fundo do Scaffold)
    final Color appBarColor = theme.appBarTheme.backgroundColor!;
    final Color appBarTitleColor = theme.appBarTheme.foregroundColor!;
    final Color appBarIconColor = theme.appBarTheme.iconTheme!.color!;
    final Color scaffoldBackgroundColor = theme.scaffoldBackgroundColor; // Fundo da tela muda com o tema

    // Cores personalizadas da extensão (para texto)
    final Color titleColor = customColors.titleColor!; // Cor para o título principal
    final Color textColor = customColors.centerTextColor!; // Cor para o texto geral

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor, // Usa a cor de fundo do tema
      appBar: AppBar(
        title: Text(
          'Sobre o App',
          style: TextStyle(
            color: appBarTitleColor, // Cor do título do AppBar do tema
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        backgroundColor: appBarColor, // Cor do AppBar do tema
        iconTheme: IconThemeData(color: appBarIconColor), // Cor do ícone do AppBar do tema
        elevation: theme.appBarTheme.elevation ?? 4, // Usa elevação do tema ou padrão
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView( // Usa SingleChildScrollView se o conteúdo puder exceder a tela
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sobre o This is Love',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: titleColor, // Usa cor da extensão
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Este aplicativo foi criado com o objetivo de ajudar casais a encontrarem atividades e lugares para fortalecerem sua conexão e aproveitarem momentos juntos.',
                style: TextStyle(fontSize: 16, color: textColor, height: 1.5), // Usa cor da extensão
              ),
              SizedBox(height: 16),
              Text(
                'Nossa missão é incentivar menos tempo de tela e mais interação real, proporcionando experiências memoráveis.',
                style: TextStyle(fontSize: 16, color: textColor, height: 1.5), // Usa cor da extensão
              ),
              // ... adicione mais texto ou widgets aqui
            ],
          ),
        ),
      ),
    );
  }
}
