
// src/suporte_page.dart
import 'package:flutter/material.dart';

class SuportePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suporte', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF8E2321),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Precisa de ajuda?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown[800])),
            SizedBox(height: 10),
            Text('Envie um e-mail para: suporte@thisislove.app'),
            SizedBox(height: 8),
            Text('Estamos disponíveis de segunda a sexta, das 9h às 18h.'),
          ],
        ),
      ),
    );
  }
}
