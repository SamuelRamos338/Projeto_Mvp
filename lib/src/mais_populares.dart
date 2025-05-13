import 'package:flutter/material.dart';

class MaisPopularesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mais Populares'),
        backgroundColor: Color(0xFF8E2321),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            leading: Image.asset('assets/Calcadao13.jpeg', width: 100, height: 100, fit: BoxFit.cover),
            title: Text('Calçadão 13 de Julho'),
            subtitle: Text('Caminhadas ao pôr do sol com vista para o rio. O lugar perfeito para um passeio romântico com sua alma gêmea.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LugarDetalhadoPage(titulo: 'Calçadão 13 de Julho', descricao: 'Passeio à beira do rio com ótimas opções de lazer, ideal para caminhadas ao pôr do sol.', imagem: 'assets/Calcadao13.jpeg')),
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            leading: Image.asset('assets/Croa.jpeg', width: 100, height: 100, fit: BoxFit.cover),
            title: Text('Crôa do Goré'),
            subtitle: Text('Bancos de areia e mar calmo para relaxar. Ideal para casais que desejam momentos tranquilos em um ambiente paradisíaco.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LugarDetalhadoPage(titulo: 'Crôa do Goré', descricao: 'Uma pequena ilha de águas calmas, perfeita para relaxar e curtir o mar.', imagem: 'assets/Croa.jpeg')),
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            leading: Image.asset('assets/Ecoparque.jpeg', width: 100, height: 100, fit: BoxFit.cover),
            title: Text('Eco Parque'),
            subtitle: Text('Natureza e tranquilidade no coração de Aracaju. Perfeito para caminhadas e momentos a dois.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LugarDetalhadoPage(titulo: 'Eco Parque', descricao: 'Um refúgio natural com trilhas e contato direto com a fauna e flora local.', imagem: 'assets/Ecoparque.jpeg')),
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            leading: Image.asset('assets/ilhadosnamorados.jpeg', width: 100, height: 100, fit: BoxFit.cover),
            title: Text('Ilha dos Namorados'),
            subtitle: Text('Passeio de lancha e praia exclusiva. Um destino perfeito para momentos íntimos a dois.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LugarDetalhadoPage(titulo: 'Ilha dos Namorados', descricao: 'A ilha oferece uma praia exclusiva para casais, ideal para um dia romântico e privado.', imagem: 'assets/ilhadosnamorados.jpeg')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LugarDetalhadoPage extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String imagem;

  LugarDetalhadoPage({required this.titulo, required this.descricao, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Color(0xFF8E2321),
      ),
      body: ListView(
        children: [
          Image.asset(imagem, width: double.infinity, height: 250, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              descricao,
              style: TextStyle(fontSize: 18, color: Colors.brown[700]),
            ),
          ),
        ],
      ),
    );
  }
}
