import 'package:flutter/material.dart';
import 'dart:async';

// Importações das páginas do menu
import 'mais_populares.dart';
import 'sobreapp_page.dart';
import 'sugestoes_para_casal.dart';
import 'suporte.dart';
import 'configuracoes_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, List<Map<String, String>>> categorias = {
    "Ao ar livre ☀️": [
      {'titulo': 'Calçadão 13 de Julho', 'descricao': 'Caminhadas ao pôr do sol com vista para o rio.', 'imagem': 'assets/Calcadao13.jpeg'},
      {'titulo': 'Crôa do Goré', 'descricao': 'Bancos de areia e mar calmo para relaxar.', 'imagem': 'assets/Croa.jpeg'},
      {'titulo': 'Eco Parque', 'descricao': 'Natureza e tranquilidade na cidade.', 'imagem': 'assets/Ecoparque.jpeg'},
      {'titulo': 'Ilha dos Namorados', 'descricao': 'Passeio de lancha e praia exclusiva.', 'imagem': 'assets/ilhadosnamorados.jpeg'},
      {'titulo': 'Orla Pôr do Sol', 'descricao': 'Fim de tarde inesquecível com vista para o rio.', 'imagem': 'assets/Orlapordosol.jpeg'},
      {'titulo': 'Parque da Sementeira', 'descricao': 'Trilhas, árvores e paz no meio da cidade.', 'imagem': 'assets/parque.jpeg'},
      {'titulo': 'Passarela do Caranguejo', 'descricao': 'Diversão, comida boa e clima descontraído.', 'imagem': 'assets/passarela.jpeg'},
      {'titulo': 'Praça Fausto Cardoso', 'descricao': 'Arquitetura charmosa e clima histórico.', 'imagem': 'assets/PracaFausto.jpeg'},
      {'titulo': 'Rio Vaza Barris', 'descricao': 'Passeio de caiaque para casais aventureiros.', 'imagem': 'assets/Riovazabarris.jpeg'},
    ],
    "Lugares modernos 🍸": [
      {'titulo': 'Le Café', 'descricao': 'Café moderno com ambiente acolhedor.', 'imagem': 'assets/lecafe.jpeg'},
      {'titulo': 'La Tavola Trattoria', 'descricao': 'Ambiente italiano romântico com luz de velas.', 'imagem': 'assets/latavola.jpeg'},
    ],
    "Passeios culturais 🏛️": [
      {'titulo': 'Teatro Tobias Barreto', 'descricao': 'Apresentações musicais, teatrais e dança.', 'imagem': 'assets/teatro.jpeg'},
      {'titulo': 'Galeria Álvaro Santos', 'descricao': 'Arte sergipana e clima tranquilo.', 'imagem': 'assets/Galeria.jpeg'},
    ],
  };

  late PageController _pageController1;
  late PageController _pageController2;
  late PageController _pageController3;
  int _currentPage1 = 0;
  int _currentPage2 = 0;
  int _currentPage3 = 0;

  @override
  void initState() {
    super.initState();
    _pageController1 = PageController(viewportFraction: 0.9);
    _pageController2 = PageController(viewportFraction: 0.9);
    _pageController3 = PageController(viewportFraction: 0.9);

    Timer.periodic(Duration(seconds: 15), (timer) {
      _currentPage1 = (_currentPage1 + 1) % categorias['Ao ar livre ☀️']!.length;
      _pageController1.animateToPage(_currentPage1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
    Timer.periodic(Duration(seconds: 20), (timer) {
      _currentPage2 = (_currentPage2 + 1) % categorias['Lugares modernos 🍸']!.length;
      _pageController2.animateToPage(_currentPage2, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
    Timer.periodic(Duration(seconds: 30), (timer) {
      _currentPage3 = (_currentPage3 + 1) % categorias['Passeios culturais 🏛️']!.length;
      _pageController3.animateToPage(_currentPage3, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _pageController1.dispose();
    _pageController2.dispose();
    _pageController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Love', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xFF8E2321),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF8E2321)),
              child: Row(
                children: [
                  Icon(Icons.menu, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text('Menu', style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Mais Populares'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MaisPopularesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Sobre o App'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SobreAppPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text('Sugestões para o casal'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SugestoesParaCasalPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.support_agent),
              title: Text('Suporte'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuportePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfiguracoesPage()),
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
            style: TextStyle(fontSize: 16, color: Colors.brown[700]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          buildCarousel('Ao ar livre ☀️', categorias['Ao ar livre ☀️']!, _pageController1),
          buildCarousel('Lugares modernos 🍸', categorias['Lugares modernos 🍸']!, _pageController2),
          buildCarousel('Passeios culturais 🏛️', categorias['Passeios culturais 🏛️']!, _pageController3),
        ],
      ),
    );
  }

  Widget buildCarousel(String title, List<Map<String, String>> items, PageController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF8E2321))),
        SizedBox(height: 10),
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: controller,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final place = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(place['imagem']!, height: 140, width: double.infinity, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(place['titulo']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Text(place['descricao']!, style: TextStyle(fontSize: 14, color: Colors.brown[700])),
                          ],
                        ),
                      ),
                    ],
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
