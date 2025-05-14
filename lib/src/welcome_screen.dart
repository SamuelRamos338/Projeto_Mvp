import 'package:flutter/material.dart';
import 'package:projeto_mvp/src/home_page.dart';
import 'themes/custom_colors.dart';

/// Tela de boas-vindas com botão de acesso e animação de carregamento
class WelcomeScreen extends StatefulWidget {
  /// Função que alterna o tema do app (claro/escuro)
  final void Function(bool) toggleTheme;

  /// Construtor recebe callback para alternar tema
  const WelcomeScreen({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  /// Indica se a tela está exibindo o indicador de progresso
  bool _isLoading = false;

  /// Acionado ao pressionar "Entrar": exibe loading rápido e navega
  void _onEnterPressed() async {
    setState(() => _isLoading = true);
    // Tempo reduzido para simular carregamento breve
    await Future.delayed(const Duration(milliseconds: 300));
    // Navega para a página principal, passando o callback de tema
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(toggleTheme: widget.toggleTheme),
      ),
    );
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    // Obtém tema e cores personalizadas
    final theme = Theme.of(context);
    final colors = theme.extension<CustomColors>()!;

    return Scaffold(
      body: Container(
        // Fundo em degradê bege, do topo para base
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5E1DA), Color(0xFFECBAB8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo central do app
                Image.asset(
                  'assets/Logo.png',
                  width: 700,
                  height: 650,
                ),
                const SizedBox(height: 30),

                // Exibe loading ou botão de entrar
                if (_isLoading) ...[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: _onEnterPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8E2321), // Vinho fixo
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}