import 'package:flutter/material.dart';
// Importa as cores personalizadas do mesmo diretório
import 'custom_colors.dart';

class SuportePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Acessa o tema atual e a extensão de cores personalizadas
    final theme = Theme.of(context);
    // Certifica que a extensão CustomColors foi adicionada ao ThemeData no seu main.dart
    final customColors = theme.extension<CustomColors>()!;

    // Cores do tema padrão (AppBar, Fundo do Scaffold, Cor do Card)
    final Color appBarColor = theme.appBarTheme.backgroundColor!;
    final Color appBarTitleColor = theme.appBarTheme.foregroundColor!;
    final Color appBarIconColor = theme.appBarTheme.iconTheme!.color!;
    final Color scaffoldBackgroundColor = theme.scaffoldBackgroundColor; // Fundo da tela muda com o tema
    final Color cardColor = theme.cardColor; // Cor do Card (definida como clara no main.dart)

    // Cores personalizadas da extensão (para texto e ícones que mudam)
    final Color titleColor = customColors.titleColor!; // Cor para o título principal
    final Color subtitleColor = customColors.subtitleColor!; // Cor para subtítulos
    final Color emailLinkColor = customColors.emailLinkColor!; // Cor para links de e-mail
    final Color iconColor = customColors.iconColor!; // Cor para ícones
    final Color cardTitleColor = customColors.cardTitleColor!; // Cor para título dentro do card
    final Color cardSubtitleColor = customColors.cardSubtitleColor!; // Cor para subtítulo dentro do card
    final Color centerTextColor = customColors.centerTextColor!; // Cor para texto central

    // A sombra do título ainda precisa ser tratada condicionalmente se não estiver na extensão
    final List<Shadow> titleShadow = theme.brightness == Brightness.dark ? [] : [
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 2,
        color: Colors.brown.withOpacity(0.4),
      ),
    ];

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor, // Usa a cor de fundo do tema
      appBar: AppBar(
        title: Text(
          'Suporte',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Precisa de ajuda?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: titleColor, shadows: titleShadow), // Usa cor da extensão e sombra condicional
            ),
            SizedBox(height: 10),
            Text(
              'Envie um e-mail para:',
              style: TextStyle(fontSize: 18, color: subtitleColor), // Usa cor da extensão
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.email, color: iconColor), // Usa cor da extensão
                SizedBox(width: 10),
                Text(
                  'suporte@thisislove.app',
                  style: TextStyle(
                    fontSize: 18,
                    color: emailLinkColor, // Usa cor da extensão
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Card(
              color: cardColor, // Usa a cor do card do tema (definida como clara)
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, color: iconColor), // Usa cor da extensão
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Horário de atendimento',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: cardTitleColor), // Usa cor da extensão
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Segunda a sexta, das 9h às 18h',
                      style: TextStyle(fontSize: 16, color: cardSubtitleColor), // Usa cor da extensão
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Estamos aqui para ajudar! Por favor, entre em contato pelo e-mail acima.',
                style: TextStyle(fontSize: 16, color: centerTextColor, fontWeight: FontWeight.w500), // Usa cor da extensão
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
