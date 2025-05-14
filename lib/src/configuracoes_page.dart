import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  final Function(bool) toggleTheme; // Função para alternar o tema

  ConfiguracoesPage({required this.toggleTheme}); // Construtor que recebe a função

  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  bool _isDarkMode = false; // Estado para o tema escuro

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
            subtitle: Text('Escolha entre claro e escuro.'),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value; // Atualiza o estado local
                  widget.toggleTheme(value); // Chama a função para alternar o tema
                });
              },
              activeColor: Color(0xFF8E2321),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificações'),
            subtitle: Text('Gerencie suas notificações.'),
            trailing: Switch(
              value: true, // Exemplo de estado de notificações
              onChanged: (value) {
                // Lógica para gerenciar notificações
              },
              activeColor: Color(0xFF8E2321),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Idioma'),
            subtitle: Text('Escolha o idioma do aplicativo.'),
            onTap: () {
              // Lógica para mudar o idioma
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacidade'),
            subtitle: Text('Gerencie permissões e dados.'),
            onTap: () {
              // Lógica para gerenciar privacidade
            },
          ),
        ],
      ),
    );
  }
}