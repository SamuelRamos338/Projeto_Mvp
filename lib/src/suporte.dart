import 'package:flutter/material.dart';
import 'themes/custom_colors.dart';

/// Página de suporte ao usuário
class SuportePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Extensão para cores personalizadas
    final colors = theme.extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Suporte'),
        backgroundColor: theme.appBarTheme.backgroundColor,
        iconTheme: theme.appBarTheme.iconTheme,
        elevation: theme.appBarTheme.elevation,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título da página
            Text(
              'Precisa de ajuda?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colors.titleColor,
              ),
            ),
            const SizedBox(height: 10),
            // Subtítulo
            Text(
              'Envie um e-mail para:',
              style: TextStyle(
                fontSize: 18,
                color: colors.subtitleColor,
              ),
            ),
            const SizedBox(height: 8),
            // Linha com ícone e e-mail
            Row(
              children: [
                Icon(Icons.email, color: colors.iconColor),
                const SizedBox(width: 10),
                Text(
                  'suporte@thisislove.app',
                  style: TextStyle(
                    fontSize: 18,
                    color: colors.emailLinkColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Card com horário de atendimento
            Card(
              color: theme.cardColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, color: colors.iconColor),
                        const SizedBox(width: 10),
                        Text(
                          'Horário de atendimento',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: colors.cardTitleColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Segunda a sexta, das 9h às 18h',
                      style: TextStyle(
                        fontSize: 16,
                        color: colors.cardSubtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Texto central de suporte
            Center(
              child: Text(
                'Estamos aqui para ajudar! Entre em contato pelo e-mail acima.',
                style: TextStyle(
                  fontSize: 16,
                  color: colors.centerTextColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}