import 'package:flutter/material.dart';
import 'package:projeto_mvp/src/home_page.dart';

class WelcomeScreen extends StatelessWidget {
  // Declara a função toggleTheme como um campo final
  final void Function(bool) toggleTheme;

  // Adiciona o parâmetro toggleTheme ao construtor
  const WelcomeScreen({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tela com fundo em degradê bege (cores fixas para a tela de boas-vindas)
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5E1DA), Color(0xFFECBAB8)], // De cima mais forte, embaixo mais claro
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0), // Espaço nas laterais
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Tudo no meio da tela
              children: [
                // Logo centralizado
                Image.asset(
                  'assets/Logo.png',
                  width: 700,
                  height: 650,
                ),
                SizedBox(height: 30), // Espaço entre logo e botão

                // Botão "Entrar"
                ElevatedButton(
                  onPressed: () {
                    // Navega para a HomePage, passando a função toggleTheme que WelcomeScreen recebeu
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(toggleTheme: toggleTheme), // Passa a função
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8E2321), // Cor vinho (fixa para o botão de entrada)
                    foregroundColor: Colors.white, // Texto branco
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Cantos arredondados
                    ),
                  ),
                  child: Text('Entrar', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
