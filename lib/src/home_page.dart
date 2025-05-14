import 'package:flutter/material.dart';
import 'dart:async';

import 'mais_populares.dart';
import 'sobreapp_page.dart';
import 'sugestoes_para_casal.dart';
import 'suporte.dart';
import 'configuracoes_page.dart';
import 'detalhes_page.dart';
import 'themes/custom_colors.dart';

/// A HomePage exibe carrosséis de lugares românticos usando um tema centralizado.
class HomePage extends StatefulWidget {
  // toggleTheme é passado para alterar o tema global do app (claro/escuro).
  final void Function(bool) toggleTheme;
  const HomePage({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Dados das categorias carregados localmente para performance offline.
  final Map<String, List<Map<String, String>>> categorias = {
    "Ao ar livre ☀️": [
      {
        'titulo': 'Calçadão 13 de Julho',
        'descricao': 'Caminhadas ao pôr do sol com vista para o rio.',
        'imagem': 'assets/Calcadao13.jpeg',
        'detalhes': 'O Calçadão 13 de Julho é um dos principais pontos turísticos de Aracaju, oferecendo um espaço ideal para caminhadas ao ar livre. Localizado à beira do rio, é perfeito para quem busca momentos de tranquilidade e relaxamento. Com uma vista encantadora do rio, o calçadão é um local ótimo para passeios ao fim da tarde, especialmente durante o pôr do sol. A atmosfera calma e agradável faz deste lugar um ótimo ponto de encontro para casais, proporcionando uma experiência romântica e serena.'
      },
      {
        'titulo': 'Crôa do Goré',
        'descricao': 'Bancos de areia e mar calmo para relaxar.',
        'imagem': 'assets/Croa.jpeg',
        'detalhes': 'A Crôa do Goré é uma formação de bancos de areia situada em frente à cidade de Aracaju, com águas calmas e uma paisagem deslumbrante. O local é perfeito para quem busca sossego e um contato íntimo com a natureza. Com suas águas tranquilas e clima relaxante, a Crôa do Goré é um excelente destino para casais que desejam escapar da agitação urbana. Ideal para passar o dia descansando, curtindo o mar e a areia, é um lugar ideal para momentos de paz e conexão.'
      },
      {
        'titulo': 'Eco Parque',
        'descricao': 'Natureza e tranquilidade na cidade.',
        'imagem': 'assets/Ecoparque.jpeg',
        'detalhes': 'O Eco Parque é uma área de preservação e lazer localizada no coração de Aracaju, que oferece um ambiente natural, ideal para quem busca fugir da rotina e se reconectar com a natureza. O parque é repleto de trilhas e espaços verdes, além de uma fauna e flora ricas, tornando-o perfeito para caminhadas tranquilas e piqueniques ao ar livre. Este é um ótimo local para casais que apreciam a tranquilidade do campo e desejam um espaço calmo, rodeado por árvores e vida selvagem.'
      },
      {
        'titulo': 'Ilha dos Namorados',
        'descricao': 'Passeio de lancha e praia exclusiva.',
        'imagem': 'assets/ilhadosnamorados.jpeg',
        'detalhes': 'A Ilha dos Namorados é um destino romântico imperdível em Aracaju, conhecida pela sua exclusividade e beleza. Para chegar até lá, é possível fazer um passeio de lancha, o que torna o trajeto ainda mais especial e único. Na ilha, os casais podem desfrutar de momentos tranquilos em uma praia privativa, longe da agitação da cidade. Com águas claras e uma vista maravilhosa, a Ilha dos Namorados é o lugar perfeito para quem busca um cenário íntimo e encantador para um dia romântico.'
      },
      {
        'titulo': 'Orla Pôr do Sol',
        'descricao': 'Fim de tarde inesquecível com vista para o rio.',
        'imagem': 'assets/Orlapordosol.jpeg',
        'detalhes': 'A Orla Pôr do Sol é um dos locais mais bonitos de Aracaju, oferecendo uma vista espetacular do pôr do sol sobre o rio Sergipe. O local é ideal para passeios tranquilos ao fim do dia, quando o céu se enche de cores vibrantes e a cidade ganha uma atmosfera mágica. Casais podem aproveitar o cenário para relaxar, tirar fotos ou simplesmente desfrutar da brisa suave enquanto observam o pôr do sol. É um lugar perfeito para momentos românticos, com uma vista inesquecível.'
      },
      {
        'titulo': 'Parque da Sementeira',
        'descricao': 'Trilhas, árvores e paz no meio da cidade.',
        'imagem': 'assets/parque.jpeg',
        'detalhes': 'O Parque da Sementeira é um verdadeiro oásis de tranquilidade no meio da cidade, oferecendo diversas opções de lazer para os amantes da natureza. O parque é conhecido pelas suas trilhas, lagos e grandes áreas verdes, proporcionando um ambiente sereno e relaxante. Ideal para caminhadas, piqueniques ou simplesmente para sentar à sombra das árvores e aproveitar a paz, o parque é um ótimo local para casais que buscam momentos de sossego e contemplação.'
      },
      {
        'titulo': 'Passarela do Caranguejo',
        'descricao': 'Diversão, comida boa e clima descontraído.',
        'imagem': 'assets/passarela.jpeg',
        'detalhes': 'A Passarela do Caranguejo é um ponto de encontro popular em Aracaju, especialmente conhecido por sua oferta gastronômica e seu clima descontraído. Localizada na Praia de Atalaia, a passarela oferece diversas opções de bares e restaurantes, com destaque para os pratos à base de frutos do mar. Com um ambiente animado e informal, é um ótimo lugar para casais que desejam desfrutar de uma boa comida e de um clima alegre e descontraído à beira-mar.'
      },
      {
        'titulo': 'Praça Fausto Cardoso',
        'descricao': 'Arquitetura charmosa e clima histórico.',
        'imagem': 'assets/PracaFausto.jpeg',
        'detalhes': 'A Praça Fausto Cardoso é uma das praças mais históricas de Aracaju, conhecida por sua arquitetura colonial e o ambiente calmo. Localizada no centro da cidade, é um lugar ideal para passeios tranquilos, com destaque para os jardins bem cuidados e as fontes que adornam o local. A praça oferece um ambiente relaxante e uma atmosfera nostálgica, sendo uma ótima opção para casais que buscam um lugar tranquilo para caminhar e desfrutar da história e da beleza de Aracaju.'
      },
      {
        'titulo': 'Rio Vaza Barris',
        'descricao': 'Passeio de caiaque para casais aventureiros.',
        'imagem': 'assets/Riovazabarris.jpeg',
        'detalhes': 'O Rio Vaza Barris oferece aos casais aventureiros a oportunidade de explorar a natureza de maneira única. Um passeio de caiaque nas águas calmas do rio permite uma imersão completa no ambiente natural, com paisagens deslumbrantes e tranquilidade. Para casais que gostam de atividades ao ar livre e desejam um pouco de aventura, o passeio de caiaque é uma ótima escolha. A proximidade com a natureza e a experiência compartilhada tornam este passeio uma ótima opção para quem busca uma atividade diferente e romântica.'
      },
    ],
    "Lugares modernos 🍸": [
      {
        'titulo': 'Le Café',
        'descricao': 'Café moderno com ambiente acolhedor.',
        'imagem': 'assets/lecafe.jpeg',
        'detalhes': 'Le Café é um café moderno e aconchegante em Aracaju, ideal para encontros românticos ou uma pausa relaxante no meio da rotina. O local oferece uma vasta gama de cafés especiais, sobremesas e opções de lanches gourmet, tudo em um ambiente intimista e acolhedor, perfeito para casais. Com decoração moderna e luz suave, o café se destaca pela atmosfera tranquila, sendo um ótimo lugar para conversas e momentos de descontração.'
      },
      {
        'titulo': 'La Tavola Trattoria',
        'descricao': 'Ambiente italiano romântico com luz de velas.',
        'imagem': 'assets/latavoa.jpeg',
        'detalhes': 'La Tavola Trattoria é um restaurante italiano sofisticado, localizado em Aracaju, que oferece uma experiência gastronômica única. Com um ambiente acolhedor, decorado com toques românticos e luz de velas, o restaurante é perfeito para jantares à luz de velas ou celebrações especiais. O cardápio é repleto de pratos típicos italianos, desde massas artesanais até deliciosos vinhos e sobremesas italianas. A atmosfera intimista e o atendimento de qualidade fazem do La Tavola o local ideal para quem procura uma noite romântica e cheia de sabor.'
      },
    ],
    "Passeios culturais 🏛️": [
      {
        'titulo': 'Teatro Tobias Barreto',
        'descricao': 'Apresentações musicais, teatrais e dança.',
        'imagem': 'assets/teatro.jpeg',
        'detalhes': 'O Teatro Tobias Barreto é o principal centro cultural de Aracaju, inaugurado em 1967 e projetado para promover a cultura e a arte na cidade. Com uma programação variada que inclui peças de teatro, concertos, danças e outras apresentações artísticas, o teatro se tornou um espaço essencial para quem busca entretenimento de qualidade. Com sua arquitetura imponente, o teatro também é um ponto turístico, proporcionando aos visitantes uma imersão na rica cultura sergipana.'
      },
      {
        'titulo': 'Galeria Álvaro Santos',
        'descricao': 'Arte sergipana e clima tranquilo.',
        'imagem': 'assets/Galeria.jpeg',
        'detalhes': 'A Galeria Álvaro Santos é um centro cultural dedicado à arte sergipana, promovendo exposições, performances e outras formas de expressão artística. Localizada no centro de Aracaju, a galeria oferece um ambiente tranquilo e sofisticado, perfeito para casais que buscam uma experiência cultural. A galeria abriga obras de artistas locais e realiza exposições temporárias, refletindo a diversidade e a riqueza cultural de Sergipe. Com um ambiente acolhedor, a galeria também serve como um ponto de encontro para amantes da arte e cultura.'
      },
    ],
  };
  // PageControllers com viewportFraction reduzido para mostrar previews dos proximos itens.
  late final PageController _pageController1 = PageController(viewportFraction: 0.9);
  late final PageController _pageController2 = PageController(viewportFraction: 0.9);
  late final PageController _pageController3 = PageController(viewportFraction: 0.9);

  // Índices atuais para sincronizar auto-scroll sem estado externo.
  int _currentPage1 = 0, _currentPage2 = 0, _currentPage3 = 0;
  final List<Timer> _timers = [];

  @override
  void initState() {
    super.initState();
    // Configura auto-scroll com delays diferentes para não sincronizar todos ao mesmo tempo.
    _timers.addAll([
      Timer.periodic(const Duration(seconds: 13), (_) => _autoScroll(_pageController1, categorias["Ao ar livre ☀️"]!, (i) => _currentPage1 = i, _currentPage1)),
      Timer.periodic(const Duration(seconds: 17), (_) => _autoScroll(_pageController2, categorias["Lugares modernos 🍸"]!, (i) => _currentPage2 = i, _currentPage2)),
      Timer.periodic(const Duration(seconds: 25), (_) => _autoScroll(_pageController3, categorias["Passeios culturais 🏛️"]!, (i) => _currentPage3 = i, _currentPage3)),
    ]);
  }

  // Método para animar o próximo item e atualizar índice.
  void _autoScroll(PageController controller, List<Map<String, String>> list, void Function(int) setIndex, int currentIndex) {
    if (!controller.hasClients) return; // Evita exceções se controlador não estiver pronto
    final next = (currentIndex + 1) % list.length;
    setIndex(next);
    controller.animateToPage(
      next,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    // Dispose de controladores e timers.
    _pageController1.dispose();
    _pageController2.dispose();
    _pageController3.dispose();
    for (var t in _timers) t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtenção centralizada do tema atual e das cores personalizadas.
    final theme         = Theme.of(context);
    final customColors  = theme.extension<CustomColors>()!;

    // Extrai cores fixas do AppBar definidas em main.dart para consistência:
    final appBarColor      = theme.appBarTheme.backgroundColor!;
    final appBarTitleColor = theme.appBarTheme.foregroundColor!;
    final appBarIconColor  = theme.appBarTheme.iconTheme!.color!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: appBarTitleColor,
        iconTheme: IconThemeData(color: appBarIconColor),
        centerTitle: true,
        title: const Text('This is Love'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: appBarColor),
              child: Row(
                children: [
                  Icon(Icons.menu, color: appBarIconColor),
                  const SizedBox(width: 8),
                  Text('Menu', style: TextStyle(color: appBarTitleColor, fontSize: 18)),
                ],
              ),
            ),
            // Uso de método auxiliar para reduzir repetição e manter coesão:
            _buildDrawerTile(Icons.star, 'Mais Populares', () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => MaisPopularesPage()));
            }, customColors),
            _buildDrawerTile(Icons.info_outline, 'Sobre o App', () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => SobreAppPage()));
            }, customColors),
            _buildDrawerTile(Icons.lightbulb, 'Sugestões para o casal', () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => SugestoesParaCasalPage()));
            }, customColors),
            _buildDrawerTile(Icons.support_agent, 'Suporte', () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => SuportePage()));
            }, customColors),
            _buildDrawerTile(Icons.settings, 'Configurações', () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => ConfiguracoesPage(toggleTheme: widget.toggleTheme)));
            }, customColors),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Mensagem central enfatiza propósito do app
          Text(
            'Menos tela, mais conexão! Saia e aproveite o dia com quem você ama. ❤️',
            style: TextStyle(fontSize: 16, color: customColors.centerTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Três carrosséis com mesmas regras de estilo:
          buildCarousel(
            'Ao ar livre ☀️', categorias['Ao ar livre ☀️']!, _pageController1,
            theme.cardColor, customColors.cardTitleColor!, customColors.cardSubtitleColor!, customColors.titleColor!,
          ),
          buildCarousel(
            'Lugares modernos 🍸', categorias['Lugares modernos 🍸']!, _pageController2,
            theme.cardColor, customColors.cardTitleColor!, customColors.cardSubtitleColor!, customColors.titleColor!,
          ),
          buildCarousel(
            'Passeios culturais 🏛️', categorias['Passeios culturais 🏛️']!, _pageController3,
            theme.cardColor, customColors.cardTitleColor!, customColors.cardSubtitleColor!, customColors.titleColor!,
          ),
        ],
      ),
    );
  }

  /// Constrói itens do drawer usando cores de CustomColors.
  Widget _buildDrawerTile(IconData icon, String title, VoidCallback onTap, CustomColors colors) {
    return ListTile(
      leading: Icon(icon, color: colors.iconColor),
      title: Text(title, style: TextStyle(color: colors.subtitleColor)),
      onTap: onTap,
    );
  }

  /// Carrossel reutilizável que usa estilos centralizados para consistência.
  Widget buildCarousel(
      String title,
      List<Map<String, String>> items,
      PageController controller,
      Color cardColor,
      Color itemTitleColor,
      Color itemDescriptionColor,
      Color categoryTitleColor,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: categoryTitleColor),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: controller,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final place = items[index];
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetalhesPage(
                        titulo: place['titulo']!,
                        descricao: place['descricao']!,
                        imagem: place['imagem']!,
                        detalhes: place['detalhes']!,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    color: cardColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            place['imagem']!,
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              height: 140,
                              color: Colors.grey[300],
                              alignment: Alignment.center,
                              child: const Icon(Icons.image_not_supported),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place['titulo']!,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: itemTitleColor),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                place['descricao']!,
                                style: TextStyle(fontSize: 14, color: itemDescriptionColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
