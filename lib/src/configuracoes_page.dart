import 'package:flutter/material.dart';
import 'login_page.dart';
import 'cadastro_page.dart';

class ConfiguracoesPage extends StatelessWidget {
  final Function(bool) toggleTheme;

  ConfiguracoesPage({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Card para alternar tema
          Card(
            elevation: 4,
            child: SwitchListTile(
              title: Text('Modo Escuro'),
              secondary: Icon(Icons.dark_mode, color: theme.iconTheme.color),
              value: theme.brightness == Brightness.dark,
              onChanged: toggleTheme,
              activeColor: Color(0xFF8E2321), // Cor vinho
            ),
          ),
          const SizedBox(height: 16),
          // Card para login
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.login, color: theme.iconTheme.color),
              title: Text('Entrar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Card para cadastro
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.person_add, color: theme.iconTheme.color),
              title: Text('Cadastre-se'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CadastroPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}