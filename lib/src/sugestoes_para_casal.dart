import 'package:flutter/material.dart';
import 'themes/custom_colors.dart';

/// Página que exibe sugestões de atividades para casais
class SugestoesParaCasalPage extends StatelessWidget {
  final List<String> dicas = [
    'Desliguem os celulares por uma hora e conversem olhando nos olhos.',
    'Façam um piquenique no parque com comidas feitas por vocês.',
    'Escolham juntos uma receita diferente e cozinhem em casal.',
    'Escrevam cartas de amor um para o outro e leiam em voz alta.',
    'Façam uma caminhada no pôr do sol sem pressa.',
    'Criem uma playlist com as músicas da história de vocês e dancem juntos.'
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Extensão CustomColors para cores personalizadas
    final colors = theme.extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Sugestões para o Casal'),
        backgroundColor: theme.appBarTheme.backgroundColor,
        iconTheme: theme.appBarTheme.iconTheme,
        elevation: theme.appBarTheme.elevation,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título da seção
            Text(
              'Ideias para aproveitar melhor o tempo a dois:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colors.titleColor,
              ),
            ),
            const SizedBox(height: 20),
            // Lista de dicas
            Expanded(
              child: ListView.builder(
                itemCount: dicas.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: theme.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Ícone decorativo
                          Container(
                            decoration: BoxDecoration(
                              color: colors.iconColor!.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.favorite,
                              color: colors.iconColor,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Texto da dica
                          Expanded(
                            child: Text(
                              dicas[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: colors.centerTextColor,
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