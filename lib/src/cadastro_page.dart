import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(Icons.person, size: 100, color: theme.iconTheme.color),
              const SizedBox(height: 16),
              _buildTextField(nameController, 'Nome', Icons.person, theme),
              const SizedBox(height: 16),
              _buildTextField(emailController, 'E-mail', Icons.email, theme),
              const SizedBox(height: 16),
              _buildTextField(passwordController, 'Senha', Icons.lock, theme, obscureText: true),
              const SizedBox(height: 16),
              _buildTextField(confirmPasswordController, 'Confirmar Senha', Icons.lock, theme, obscureText: true),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  final name = nameController.text;

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text('Bem-vindo, $name!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8E2321),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: Text('Cadastrar', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, ThemeData theme, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: theme.iconTheme.color),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: theme.cardColor,
      ),
      obscureText: obscureText,
    );
  }
}