import 'package:flutter/material.dart';
// Importa as cores personalizadas do mesmo diretório
import 'themes/custom_colors.dart';

class DetalhesPage extends StatelessWidget {
  // Parâmetros que a página de detalhes recebe
  final String titulo;
  final String imagem;
  final String descricao;
  final String detalhes;

  const DetalhesPage({
    Key? key,
    required this.titulo,
    required this.imagem,
    required this.descricao,
    required this.detalhes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Acessa o tema atual e a extensão de cores personalizadas
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;

    // Cor do fundo da tela, título e ícones do AppBar
    final appBarColor = theme.appBarTheme.backgroundColor!;
    final appBarTitleColor = theme.appBarTheme.foregroundColor!;
    final appBarIconColor = theme.appBarTheme.iconTheme!.color!;
    final scaffoldBackgroundColor = theme.scaffoldBackgroundColor;

    // Cores personalizadas da extensão
    final detailTitleColor = customColors.titleColor!;
    final detailTextColor = customColors.centerTextColor!;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          titulo,
          style: TextStyle(
            color: appBarTitleColor,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(color: appBarIconColor),
        elevation: theme.appBarTheme.elevation ?? 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do local
            ClipRRect(
              child: Image.asset(
                imagem,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                    alignment: Alignment.center,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título do local
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: detailTitleColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Detalhes completos do local
                  Text(
                    detalhes,
                    style: TextStyle(
                      fontSize: 16,
                      color: detailTextColor,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
