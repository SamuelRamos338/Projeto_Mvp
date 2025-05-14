import 'package:flutter/material.dart';
// Importa as cores personalizadas do mesmo diretório (ajuste o caminho se necessário)
import 'custom_colors.dart';
// Importa a página de detalhes para navegação
// Assumindo que LugarDetalhadoPage está definida neste mesmo arquivo ou importada aqui
// Se LugarDetalhadoPage estiver em outro arquivo (ex: detalhes_page.dart),
// ajuste o import para 'detalhes_page.dart'.
// import 'detalhes_page.dart'; // Exemplo se estiver em outro arquivo

// Definição da LugarDetalhadoPage (mantida aqui para o código ser autocontido,
// mas idealmente estaria em seu próprio arquivo como detalhes_page.dart)
class LugarDetalhadoPage extends StatelessWidget {
  final String titulo;
  final String descricao; // Mantido como o texto principal conforme seu código
  final String imagem;

  LugarDetalhadoPage({required this.titulo, required this.descricao, required this.imagem});

  @override
  Widget build(BuildContext context) {
    // Acessa o tema atual e a extensão de cores personalizadas
    final theme = Theme.of(context);
    // Certifica que a extensão CustomColors foi adicionada ao ThemeData no seu main.dart
    final customColors = theme.extension<CustomColors>()!;

    // Cores do tema padrão (AppBar, Fundo do Scaffold)
    final Color appBarColor = theme.appBarTheme.backgroundColor!; // Cor fixa do AppBar
    final Color appBarTitleColor = theme.appBarTheme.foregroundColor!; // Cor fixa do título do AppBar
    final Color appBarIconColor = theme.appBarTheme.iconTheme!.color!; // Cor fixa do ícone do AppBar
    final Color scaffoldBackgroundColor = theme.scaffoldBackgroundColor; // Fundo da tela muda com o tema

    // Cor personalizada da extensão para o texto principal
    final Color detailTextColor = customColors.centerTextColor!;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor, // Usa a cor de fundo do tema
      appBar: AppBar(
        title: Text(
          titulo, // O título do local no AppBar
          style: TextStyle(
            color: appBarTitleColor, // Cor fixa do título do AppBar
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          // Adiciona um overflow para evitar que o título fique muito longo no AppBar
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: appBarColor, // Cor fixa do AppBar
        iconTheme: IconThemeData(color: appBarIconColor), // Cor fixa do ícone do AppBar
        elevation: theme.appBarTheme.elevation ?? 4, // Usa elevação do tema ou padrão
      ),
      body: ListView( // Usando ListView para permitir rolagem
        children: [
          // Imagem do local
          Image.asset(
            imagem,
            width: double.infinity, // Ocupa a largura total disponível
            height: 260, // Altura fixa para a imagem
            fit: BoxFit.cover, // Cobre a área sem distorcer
            // Adiciona tratamento de erro para a imagem
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 260,
                color: Colors.grey[300], // Cor de fundo para placeholder
                child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                alignment: Alignment.center,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              descricao, // Exibe o texto principal (descricao)
              style: TextStyle(
                fontSize: 19,
                color: detailTextColor, // Usa cor da extensão para o texto
                height: 1.5, // Espaçamento entre linhas
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          // ... adicione mais informações ou widgets aqui
        ],
      ),
    );
  }
}


// Definição da MaisPopularesPage
class MaisPopularesPage extends StatelessWidget {
  // Lista de dados de exemplo para os itens populares (mantida como você forneceu)
  final List<Map<String, String>> popularItems = [
    {
      'titulo': 'Calçadão 13 de Julho',
      'descricao': 'Caminhadas ao pôr do sol com vista para o rio. O lugar perfeito para um passeio romântico com sua alma gêmea.',
      'imagem': 'assets/Calcadao13.jpeg'
    },
    {
      'titulo': 'Crôa do Goré',
      'descricao': 'Bancos de areia e mar calmo para relaxar. Ideal para casais que desejam momentos tranquilos em um ambiente paradisíaco.',
      'imagem': 'assets/Croa.jpeg'
    },
    {
      'titulo': 'Eco Parque',
      'descricao': 'Natureza e tranquilidade no coração de Aracaju. Perfeito para caminhadas e momentos a dois.',
      'imagem': 'assets/Ecoparque.jpeg'
    },
    {
      'titulo': 'Ilha dos Namorados',
      'descricao': 'Passeio de lancha e praia exclusiva. Um destino perfeito para momentos íntimos a dois.',
      'imagem': 'assets/ilhadosnamorados.jpeg'
    },
    // Adicione mais itens conforme necessário
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

    // Cores personalizadas da extensão (para texto e outros elementos que mudam)
    // Usando as cores definidas na extensão para texto dentro dos cards claros
    final Color itemTitleColor = customColors.cardTitleColor!;
    final Color itemDescriptionColor = customColors.cardSubtitleColor!;
    // A cor do selo "Popular" e seu conteúdo são mantidos fixos conforme seu código
    final Color popularBadgeColor = Colors.amber[700]!;
    final Color popularIconTextColor = Colors.white;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor, // Usa a cor de fundo do tema
      appBar: AppBar(
        title: Text(
          'Mais Populares',
          style: TextStyle(
            color: appBarTitleColor, // Cor do título do AppBar do tema
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        backgroundColor: appBarColor, // Cor do AppBar do tema (fixa no main.dart)
        iconTheme: IconThemeData(color: appBarIconColor), // Cor do ícone do AppBar do tema (fixa no main.dart)
        elevation: theme.appBarTheme.elevation ?? 4, // Usa elevação do tema ou padrão
      ),
      body: ListView( // Mantendo o ListView original
        padding: EdgeInsets.all(16),
        children: popularItems.map((item) { // Mapeia a lista de dados para widgets
          return buildListTile(
            context,
            item['titulo']!,
            item['descricao']!,
            item['imagem']!,
            cardColor, // Passa as cores do tema para o método auxiliar
            itemTitleColor,
            itemDescriptionColor,
            popularBadgeColor,
            popularIconTextColor,
          );
        }).toList(), // Converte o resultado em uma lista de widgets
      ),
    );
  }

  // Método auxiliar para construir os cards (ListTiles visuais)
  Widget buildListTile(
      BuildContext context,
      String titulo,
      String subtitle,
      String imagem,
      Color cardColor, // Recebe a cor do card do tema
      Color itemTitleColor, // Recebe a cor do título do item do tema
      Color itemDescriptionColor, // Recebe a cor da descrição do item do tema
      Color popularBadgeColor, // Cor fixa do selo
      Color popularIconTextColor, // Cor fixa do ícone/texto do selo
      ) {
    // Acessa o tema para cores como shadowColor e splashColor
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 8,
      shadowColor: theme.shadowColor.withOpacity(0.4), // Usa a shadowColor do tema
      color: cardColor, // Usa a cor do card do tema (definida como clara)
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        splashColor: theme.splashColor.withOpacity(0.2), // Usa a splashColor do tema
        onTap: () {
          // Navega para a página de detalhes ao clicar no card
          Navigator.push(
            context,
            MaterialPageRoute(
              // Passa os dados para LugarDetalhadoPage
              builder: (context) => LugarDetalhadoPage(
                titulo: titulo,
                descricao: subtitle, // Passa a descrição como texto principal
                imagem: imagem,
              ),
            ),
          );
        },
        child: Stack( // Mantendo o Stack para posicionar o selo
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagem do local
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  child: Image.asset(
                    imagem,
                    width: double.infinity,
                    height: 170,
                    fit: BoxFit.cover,
                    // Adiciona tratamento de erro para a imagem
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 170,
                        color: Colors.grey[300], // Cor de fundo para placeholder
                        child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                        alignment: Alignment.center,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: itemTitleColor, // Usa cor da extensão (escuro no card claro)
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: itemDescriptionColor, // Usa cor da extensão (escuro no card claro)
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            // Selo Popular no canto superior direito
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: popularBadgeColor, // Cor fixa para o selo
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: popularBadgeColor.withOpacity(0.6), // Sombra baseada na cor do selo
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, size: 18, color: popularIconTextColor), // Cor fixa para ícone no selo
                    SizedBox(width: 6),
                    Text(
                      'Popular',
                      style: TextStyle(
                        color: popularIconTextColor, // Cor fixa para texto no selo
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
