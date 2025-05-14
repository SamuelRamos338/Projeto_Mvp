import 'package:flutter/material.dart';
import 'themes/custom_colors.dart';

/// Página que apresenta informações sobre o aplicativo
class SobreAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Extensão CustomColors no ThemeData para cores específicas
    final colors = theme.extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Sobre o App'),
        backgroundColor: theme.appBarTheme.backgroundColor,
        iconTheme: theme.appBarTheme.iconTheme,
        elevation: theme.appBarTheme.elevation,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal da página
            Text(
              'Sobre o This is Love',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colors.titleColor,
              ),
            ),
            const SizedBox(height: 16),
            // Parágrafo explicativo
            Text(
              'Este aplicativo foi criado com o objetivo de ajudar casais a encontrarem atividades e lugares para fortalecerem sua conexão e aproveitarem momentos juntos.',
              style: TextStyle(
                fontSize: 16,
                color: colors.centerTextColor,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            // Missão do app
            Text(
              'Nossa missão é incentivar menos tempo de tela e mais interação real, proporcionando experiências memoráveis.',
              style: TextStyle(
                fontSize: 16,
                color: colors.centerTextColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}