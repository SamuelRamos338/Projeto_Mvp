// src/sobre_app_page.dart
import 'package:flutter/material.dart';

class SobreAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o App', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF8E2321),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('This is Love ❤️', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown[800])),
            SizedBox(height: 10),
            Text('O aplicativo foi criado para incentivar casais a viverem momentos de qualidade juntos, desconectando-se um pouco da tecnologia. Descubra lugares românticos, atividades culturais e ideias para fortalecer seu relacionamento.'),
            SizedBox(height: 20),
            Text('Versão: 1.0.0', style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
