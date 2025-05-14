import 'package:flutter/material.dart';
import 'themes/custom_colors.dart';

// Definição da LugarDetalhadoPage
class LugarDetalhadoPage extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String imagem;

  LugarDetalhadoPage({required this.titulo, required this.descricao, required this.imagem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;
    final appBarTheme = theme.appBarTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          titulo,
          style: TextStyle(
            color: appBarTheme.foregroundColor!,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: appBarTheme.backgroundColor!,
        iconTheme: IconThemeData(color: appBarTheme.iconTheme!.color!),
        elevation: appBarTheme.elevation ?? 4,
      ),
      body: ListView(
        children: [
          Image.asset(
            imagem,
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 260,
              color: Colors.grey[300],
              child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              descricao,
              style: TextStyle(
                fontSize: 19,
                color: customColors.centerTextColor!,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

// Definição da MaisPopularesPage
class MaisPopularesPage extends StatelessWidget {
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
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;
    final appBarTheme = theme.appBarTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Mais Populares',
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
        children: popularItems.map((item) {
          return buildListTile(
            context,
            item['titulo']!,
            item['descricao']!,
            item['imagem']!,
            theme.cardColor,
            customColors.cardTitleColor!,
            customColors.cardSubtitleColor!,
            Colors.amber[700]!,
            Colors.white,
          );
        }).toList(),
      ),
    );
  }

  Widget buildListTile(
      BuildContext context,
      String titulo,
      String subtitle,
      String imagem,
      Color cardColor,
      Color itemTitleColor,
      Color itemDescriptionColor,
      Color popularBadgeColor,
      Color popularIconTextColor,
      ) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 8,
      shadowColor: theme.shadowColor.withOpacity(0.4),
      color: cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        splashColor: theme.splashColor.withOpacity(0.2),
        onTap: () {
          // Navega para a página de detalhes passando os dados corretos
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LugarDetalhadoPage(
                titulo: titulo,
                descricao: subtitle,
                imagem: imagem,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  child: Image.asset(
                    imagem,
                    width: double.infinity,
                    height: 170,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 170,
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: itemTitleColor,
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
                      color: itemDescriptionColor,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: popularBadgeColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: popularBadgeColor.withOpacity(0.6),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, size: 18, color: popularIconTextColor),
                    SizedBox(width: 6),
                    Text(
                      'Popular',
                      style: TextStyle(
                        color: popularIconTextColor,
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
