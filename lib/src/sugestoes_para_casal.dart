import 'package:flutter/material.dart';
// Importa as cores personalizadas do mesmo diretório (ajuste o caminho se necessário)
import 'custom_colors.dart';

class SugestoesParaCasalPage extends StatelessWidget {
  final List<String> dicas = [
    "Desliguem os celulares por uma hora e conversem olhando nos olhos.",
    "Façam um piquenique no parque com comidas feitas por vocês.",
    "Escolham juntos uma receita diferente e cozinhem em casal.",
    "Escrevam cartas de amor um para o outro e leiam em voz alta.",
    "Façam uma caminhada no pôr do sol sem pressa.",
    "Criem uma playlist com as músicas da história de vocês e dancem juntos."
  ];

  @override
  Widget build(BuildContext context) {
    // Acessa o tema atual e a extensão de cores personalizadas
    final theme = Theme.of(context);
    // Certifica que a extensão CustomColors foi adicionada ao ThemeData no seu main.dart
    final customColors = theme.extension<CustomColors>()!;

    // Cores do tema padrão (AppBar, Fundo do Scaffold, Cor do Card)
    final Color appBarColor = theme.appBarTheme.backgroundColor!; // Cor fixa do AppBar
    final Color appBarTitleColor = theme.appBarTheme.foregroundColor!; // Cor fixa do título do AppBar
    final Color appBarIconColor = theme.appBarTheme.iconTheme!.color!; // Cor fixa do ícone do AppBar
    final Color scaffoldBackgroundColor = theme.scaffoldBackgroundColor; // Fundo da tela muda com o tema
    final Color cardColor = theme.cardColor; // Cor do Card (definida como clara no main.dart)

    // Cores personalizadas da extensão (para texto e ícones)
    final Color pageTitleColor = customColors.titleColor!; // Cor para o título "Ideias para aproveitar..."
    // Usando as cores definidas na extensão para texto dentro dos cards claros
    final Color itemTextColor = customColors.cardSubtitleColor!; // Cor para o texto das dicas dentro dos cards
    final Color iconBgColor = theme.brightness == Brightness.dark ? Colors.red.shade900 : Colors.redAccent.shade100; // Cor de fundo do ícone (pode variar)
    final Color iconColor = theme.brightness == Brightness.dark ? Colors.red.shade300 : Colors.red.shade700; // Cor do ícone (pode variar)


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
          'Sugestões para o Casal',
          style: TextStyle(
            color: appBarTitleColor, // Cor do título do AppBar do tema
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        backgroundColor: appBarColor, // Cor do AppBar do tema (fixa no main.dart)
        elevation: theme.appBarTheme.elevation ?? 4, // Usa elevação do tema ou padrão
        iconTheme: IconThemeData(color: appBarIconColor), // Cor do ícone do AppBar do tema (fixa no main.dart)
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ideias para aproveitar melhor o tempo a dois:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: pageTitleColor, // Usa cor da extensão para o título da página
                shadows: titleShadow, // Sombra condicional
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dicas.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: cardColor, // Usa a cor do card do tema (definida como clara)
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: iconBgColor, // Cor de fundo do ícone (pode variar)
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.favorite,
                              color: iconColor, // Cor do ícone (pode variar)
                              size: 24,
                              semanticLabel: 'Dica favorita',
                            ),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              dicas[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: itemTextColor, // Usa cor da extensão para o texto da dica
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
