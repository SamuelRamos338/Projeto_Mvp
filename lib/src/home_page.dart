import 'package:flutter/material.dart';
import 'dart:async';

// Importa as páginas do menu e DetalhesPage
import 'mais_populares.dart';
import 'sobreapp_page.dart';
import 'sugestoes_para_casal.dart';
import 'suporte.dart';
import 'configuracoes_page.dart';
import 'detalhes_page.dart';
// Importa as cores personalizadas do mesmo diretório (ajuste o caminho se necessário)
import 'custom_colors.dart';

class HomePage extends StatefulWidget {
  // Declara a função toggleTheme como um campo final
  final void Function(bool) toggleTheme;

  // Adiciona o parâmetro toggleTheme ao construtor
  const HomePage({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dados das categorias e locais
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

  // Controladores para os PageViews
  late PageController _pageController1;
  late PageController _pageController2;
  late PageController _pageController3;

  // Índices das páginas atuais para auto-scroll
  int _currentPage1 = 0;
  int _currentPage2 = 0;
  int _currentPage3 = 0;

  // Timers para o auto-scroll
  List<Timer> _timers = [];

  @override
  void initState() {
    super.initState();
    // Inicializa os PageControllers
    _pageController1 = PageController(viewportFraction: 0.9);
    _pageController2 = PageController(viewportFraction: 0.9);
    _pageController3 = PageController(viewportFraction: 0.9);

    // Configura timers para auto-scroll dos carrosséis
    _timers.add(Timer.periodic(Duration(seconds: 15), (timer) {
      if (_pageController1.hasClients) { // Verifica se o controlador está anexado
        _currentPage1 = (_currentPage1 + 1) % categorias['Ao ar livre ☀️']!.length;
        _pageController1.animateToPage(_currentPage1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    }));
    _timers.add(Timer.periodic(Duration(seconds: 20), (timer) {
      if (_pageController2.hasClients) { // Verifica se o controlador está anexado
        _currentPage2 = (_currentPage2 + 1) % categorias['Lugares modernos 🍸']!.length;
        _pageController2.animateToPage(_currentPage2, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    }));
    _timers.add(Timer.periodic(Duration(seconds: 30), (timer) {
      if (_pageController3.hasClients) { // Verifica se o controlador está anexado
        _currentPage3 = (_currentPage3 + 1) % categorias['Passeios culturais 🏛️']!.length;
        _pageController3.animateToPage(_currentPage3, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    }));
  }

  @override
  void dispose() {
    // Libera os PageControllers
    _pageController1.dispose();
    _pageController2.dispose();
    _pageController3.dispose();
    // Cancela todos os timers para evitar vazamentos de memória
    for (var timer in _timers) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Acessa o tema atual e a extensão de cores personalizadas
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;

    // Cores do tema padrão (AppBar, Fundo do Scaffold, Cor do Card)
    final Color appBarColor = theme.appBarTheme.backgroundColor!;
    final Color appBarTitleColor = theme.appBarTheme.foregroundColor!;
    final Color appBarIconColor = theme.appBarTheme.iconTheme!.color!;
    final Color scaffoldBackgroundColor = theme.scaffoldBackgroundColor; // Fundo da tela muda com o tema
    final Color cardColor = theme.cardColor; // Cor do Card (definida como clara no main.dart)

    // Cores personalizadas da extensão (para texto)
    final Color messageTextColor = customColors.centerTextColor!; // Cor para o texto da mensagem inicial
    // Usando as cores definidas na extensão para texto dentro dos cards claros
    final Color itemTitleColor = customColors.cardTitleColor!;
    final Color itemDescriptionColor = customColors.cardSubtitleColor!;
    final Color categoryTitleColor = customColors.titleColor!; // Cor para os títulos das categorias

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor, // Usa a cor de fundo do tema
      appBar: AppBar(
        title: Text('This is Love', style: TextStyle(color: appBarTitleColor)), // Usa cor do tema
        centerTitle: true,
        backgroundColor: appBarColor, // Usa cor do tema
        iconTheme: IconThemeData(color: appBarIconColor), // Usa cor do tema
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: appBarColor), // Usa cor do tema
              child: Row(
                children: [
                  Icon(Icons.menu, color: appBarIconColor, size: 20), // Usa cor do tema
                  SizedBox(width: 8),
                  Text('Menu', style: TextStyle(color: appBarTitleColor, fontSize: 18)), // Usa cor do tema
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.star, color: customColors.iconColor), // Exemplo de uso de cor da extensão
              title: Text('Mais Populares', style: TextStyle(color: customColors.subtitleColor)), // Exemplo de uso de cor da extensão
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MaisPopularesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: customColors.iconColor), // Exemplo de uso de cor da extensão
              title: Text('Sobre o App', style: TextStyle(color: customColors.subtitleColor)), // Exemplo de uso de cor da extensão
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SobreAppPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb, color: customColors.iconColor), // Exemplo de uso de cor da extensão
              title: Text('Sugestões para o casal', style: TextStyle(color: customColors.subtitleColor)), // Exemplo de uso de cor da extensão
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SugestoesParaCasalPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.support_agent, color: customColors.iconColor), // Exemplo de uso de cor da extensão
              title: Text('Suporte', style: TextStyle(color: customColors.subtitleColor)), // Exemplo de uso de cor da extensão
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuportePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: customColors.iconColor), // Exemplo de uso de cor da extensão
              title: Text('Configurações', style: TextStyle(color: customColors.subtitleColor)), // Exemplo de uso de cor da extensão
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  // Passa a função toggleTheme que HomePage recebeu
                  MaterialPageRoute(builder: (context) => ConfiguracoesPage(toggleTheme: widget.toggleTheme)),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Menos tela, mais conexão! Saia e aproveite o dia com quem você ama. ❤️',
            style: TextStyle(fontSize: 16, color: messageTextColor), // Usa cor da extensão
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Constrói os carrosséis usando o tema
          buildCarousel('Ao ar livre ☀️', categorias['Ao ar livre ☀️']!, _pageController1, cardColor, itemTitleColor, itemDescriptionColor, categoryTitleColor),
          buildCarousel('Lugares modernos 🍸', categorias['Lugares modernos 🍸']!, _pageController2, cardColor, itemTitleColor, itemDescriptionColor, categoryTitleColor),
          buildCarousel('Passeios culturais 🏛️', categorias['Passeios culturais 🏛️']!, _pageController3, cardColor, itemTitleColor, itemDescriptionColor, categoryTitleColor),
        ],
      ),
    );
  }

  // Método auxiliar para construir os carrosséis
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
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: categoryTitleColor, // Usa cor da extensão para o título da categoria
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: controller,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final place = items[index];
              return InkWell(
                onTap: () {
                  // Navega para a página de detalhes ao clicar no card
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalhesPage(
                        titulo: place['titulo'] ?? '',
                        imagem: place['imagem'] ?? '',
                        descricao: place['descricao'] ?? '',
                        detalhes: place['detalhes'] ?? place['descricao'] ?? '',
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    color: cardColor, // Usa a cor do card do tema (definida como clara)
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Imagem do local
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            place['imagem']!,
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            // Adicione tratamento de erro para a imagem se necessário
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 140,
                                color: Colors.grey[300],
                                child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                                alignment: Alignment.center,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place['titulo']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: itemTitleColor, // Usa cor da extensão (para texto escuro no card claro)
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                place['descricao']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: itemDescriptionColor, // Usa cor da extensão (para texto escuro no card claro)
                                ),
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
        SizedBox(height: 24),
      ],
    );
  }
}
