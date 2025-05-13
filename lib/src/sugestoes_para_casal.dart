// src/sugestoes_para_casal.dart
import 'package:flutter/material.dart';

class SugestoesParaCasalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sugestões para o Casal', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF8E2321),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Ideias para aproveitar melhor o tempo a dois:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[800]),
          ),
          SizedBox(height: 16),
          ...["Desliguem os celulares por uma hora e conversem olhando nos olhos.",
            "Façam um piquenique no parque com comidas feitas por vocês.",
            "Escolham juntos uma receita diferente e cozinhem em casal.",
            "Escrevam cartas de amor um para o outro e leiam em voz alta.",
            "Façam uma caminhada no pôr do sol sem pressa.",
            "Criem uma playlist com as músicas da história de vocês e dancem juntos."
          ].map((dica) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.favorite, color: Colors.redAccent),
                SizedBox(width: 8),
                Expanded(child: Text(dica, style: TextStyle(fontSize: 16))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

