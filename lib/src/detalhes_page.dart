import 'package:flutter/material.dart';
// Importa as cores personalizadas do mesmo diretório
import 'custom_colors.dart';

class DetalhesPage extends StatelessWidget {
  // Parâmetros que a página de detalhes recebe
  final String titulo;
  final String imagem;
  final String descricao; // Breve descrição (pode não ser usada nesta página se 'detalhes' for o principal)
  final String detalhes; // Descrição completa

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
    // Certifica que a extensão CustomColors foi adicionada ao ThemeData no seu main.dart
    final customColors = theme.extension<CustomColors>()!;

    // Cores do tema padrão (AppBar, Fundo do Scaffold)
    final Color appBarColor = theme.appBarTheme.backgroundColor!;
    final Color appBarTitleColor = theme.appBarTheme.foregroundColor!;
    final Color appBarIconColor = theme.appBarTheme.iconTheme!.color!;
    final Color scaffoldBackgroundColor = theme.scaffoldBackgroundColor; // Fundo da tela muda com o tema

    // Cores personalizadas da extensão (para texto)
    final Color detailTitleColor = customColors.titleColor!; // Cor para o título principal
    final Color detailTextColor = customColors.centerTextColor!; // Cor para o texto dos detalhes

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor, // Usa a cor de fundo do tema
      appBar: AppBar(
        title: Text(
          titulo, // O título do local no AppBar
          style: TextStyle(
            color: appBarTitleColor, // Cor do título do AppBar do tema
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          // Adiciona um overflow para evitar que o título fique muito longo no AppBar
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: appBarColor, // Cor do AppBar do tema
        iconTheme: IconThemeData(color: appBarIconColor), // Cor do ícone do AppBar do tema
        elevation: theme.appBarTheme.elevation ?? 4, // Usa elevação do tema ou padrão
      ),
      body: SingleChildScrollView( // Permite rolar se o conteúdo for muito longo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do local
            ClipRRect(
              // Pode ajustar o borderRadius se quiser
              // borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagem,
                width: double.infinity, // Ocupa a largura total disponível
                height: 250, // Altura fixa para a imagem
                fit: BoxFit.cover, // Cobre a área sem distorcer
                // Adicione tratamento de erro para a imagem se necessário
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
                  // Título do local (repetido no body para destaque)
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: detailTitleColor, // Usa cor da extensão
                    ),
                  ),
                  SizedBox(height: 16),
                  // Detalhes completos do local
                  Text(
                    detalhes,
                    style: TextStyle(
                      fontSize: 16,
                      color: detailTextColor, // Usa cor da extensão
                      height: 1.5, // Espaçamento entre linhas
                    ),
                  ),
                  // ... adicione mais informações ou widgets aqui
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
