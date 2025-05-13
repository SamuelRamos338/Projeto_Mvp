// src/configuracoes_page.dart
import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF8E2321),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Tema do aplicativo'),
            subtitle: Text('Escolha entre claro e escuro (em breve).'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacidade'),
            subtitle: Text('Gerencie permissões e dados.'),
          ),
        ],
      ),
    );
  }
}

