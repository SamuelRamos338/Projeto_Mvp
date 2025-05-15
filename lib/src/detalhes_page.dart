import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'themes/custom_colors.dart';

class DetalhesPage extends StatefulWidget {
  final String titulo;
  final String imagem;
  final String descricao;
  final String detalhes;

  const DetalhesPage({
    Key? key,
    required this.titulo,
    required this.imagem,
    required this.descricao,
    required this.detalhes,
  }) : super(key: key);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  final Map<String, List<Map<String, dynamic>>> comentariosPorLocal = {
    "Calçadão 13 de Julho": [
      {"titulo": "Romântico", "texto": "Passeio perfeito ao pôr do sol com meu amor.", "rating": 5.0},
      {"titulo": "Tranquilo", "texto": "Caminhada relaxante e ótima para conversar.", "rating": 4.5},
      {"titulo": "Vista incrível", "texto": "A vista do rio é maravilhosa, adoramos!", "rating": 5.0},
      {"titulo": "Agradável", "texto": "Lugar calmo para momentos a dois.", "rating": 4.0},
      {"titulo": "Recomendo", "texto": "Ótimo para casais que gostam de natureza.", "rating": 5.0},
    ],
    "Crôa do Goré": [
      {"titulo": "Relaxante", "texto": "Dia incrível com meu parceiro, super tranquilo.", "rating": 4.5},
      {"titulo": "Paisagem", "texto": "Vista linda, perfeito para casais.", "rating": 5.0},
      {"titulo": "Natureza", "texto": "Contato direto com a natureza, adoramos!", "rating": 4.0},
      {"titulo": "Tranquilidade", "texto": "Ambiente calmo e romântico.", "rating": 4.8},
      {"titulo": "Encantador", "texto": "Um dos melhores lugares para casais.", "rating": 5.0},
    ],
    "Eco Parque": [
      {"titulo": "Natureza", "texto": "Passeio tranquilo e romântico no meio da natureza.", "rating": 4.0},
      {"titulo": "Agradável", "texto": "Ótimo para piqueniques a dois.", "rating": 4.5},
      {"titulo": "Trilhas", "texto": "Caminhamos juntos e foi maravilhoso.", "rating": 4.0},
      {"titulo": "Calmo", "texto": "Ambiente perfeito para relaxar com meu amor.", "rating": 4.5},
      {"titulo": "Recomendo", "texto": "Ideal para casais que gostam de natureza.", "rating": 4.8},
    ],
    "Ilha dos Namorados": [
      {"titulo": "Romântico", "texto": "Lugar perfeito para casais, adoramos a exclusividade.", "rating": 5.0},
      {"titulo": "Exclusivo", "texto": "Praia tranquila e reservada, muito especial.", "rating": 4.8},
      {"titulo": "Beleza", "texto": "Paisagem deslumbrante, momentos inesquecíveis.", "rating": 5.0},
      {"titulo": "Especial", "texto": "Um lugar único para casais apaixonados.", "rating": 4.9},
      {"titulo": "Recomendo", "texto": "Vale muito a pena visitar com quem você ama.", "rating": 5.0},
    ],
    "Orla Pôr do Sol": [
      {"titulo": "Lindo", "texto": "Pôr do sol inesquecível com meu parceiro.", "rating": 5.0},
      {"titulo": "Atmosfera", "texto": "Clima perfeito para relaxar juntos.", "rating": 4.7},
      {"titulo": "Romântico", "texto": "Ideal para casais, adoramos o cenário.", "rating": 5.0},
      {"titulo": "Encantador", "texto": "Vista incrível, momentos mágicos.", "rating": 5.0},
      {"titulo": "Recomendo", "texto": "Um dos melhores lugares para casais.", "rating": 4.8},
    ],
    "Parque da Sementeira": [
      {"titulo": "Tranquilo", "texto": "Ótimo para piqueniques a dois.", "rating": 4.5},
      {"titulo": "Natureza", "texto": "Contato com a natureza, perfeito para casais.", "rating": 4.8},
      {"titulo": "Relaxante", "texto": "Ambiente calmo e romântico.", "rating": 4.7},
      {"titulo": "Agradável", "texto": "Passeio maravilhoso com meu amor.", "rating": 5.0},
      {"titulo": "Recomendo", "texto": "Ideal para momentos tranquilos a dois.", "rating": 5.0},
    ],
    "Passarela do Caranguejo": [
      {"titulo": "Divertido", "texto": "Ótimo lugar para casais que gostam de boa comida.", "rating": 4.5},
      {"titulo": "Animado", "texto": "Clima descontraído e perfeito para um encontro.", "rating": 4.8},
      {"titulo": "Gastronomia", "texto": "Comida deliciosa, adoramos o ambiente.", "rating": 5.0},
      {"titulo": "Especial", "texto": "Noite incrível com meu parceiro.", "rating": 4.9},
      {"titulo": "Recomendo", "texto": "Perfeito para casais que gostam de diversão.", "rating": 5.0},
    ],
    "Praça Fausto Cardoso": [
      {"titulo": "Histórico", "texto": "Passeio tranquilo e cheio de história.", "rating": 4.5},
      {"titulo": "Charmoso", "texto": "Lugar calmo e perfeito para casais.", "rating": 4.8},
      {"titulo": "Agradável", "texto": "Adoramos caminhar juntos por aqui.", "rating": 5.0},
      {"titulo": "Relaxante", "texto": "Ótimo para momentos tranquilos a dois.", "rating": 4.9},
      {"titulo": "Recomendo", "texto": "Ambiente perfeito para casais.", "rating": 5.0},
    ],
    "Rio Vaza Barris": [
      {"titulo": "Aventura", "texto": "Passeio de caiaque incrível com meu amor.", "rating": 5.0},
      {"titulo": "Natureza", "texto": "Contato direto com a natureza, adoramos!", "rating": 4.8},
      {"titulo": "Tranquilo", "texto": "Ambiente calmo e romântico.", "rating": 4.7},
      {"titulo": "Especial", "texto": "Experiência única e inesquecível.", "rating": 5.0},
      {"titulo": "Recomendo", "texto": "Ideal para casais aventureiros.", "rating": 5.0},
    ],
    "Le Café": [
      {"titulo": "Aconchegante", "texto": "Ambiente perfeito para um café a dois.", "rating": 5.0},
      {"titulo": "Charmoso", "texto": "Lugar tranquilo e romântico.", "rating": 4.8},
      {"titulo": "Delicioso", "texto": "Cafés incríveis e sobremesas deliciosas.", "rating": 5.0},
      {"titulo": "Especial", "texto": "Ótimo para conversas e momentos juntos.", "rating": 4.9},
      {"titulo": "Recomendo", "texto": "Ideal para casais que gostam de cafés especiais.", "rating": 5.0},
    ],
    "La Tavola Trattoria": [
      {"titulo": "Romântico", "texto": "Jantar à luz de velas inesquecível.", "rating": 5.0},
      {"titulo": "Sofisticado", "texto": "Ambiente elegante e acolhedor.", "rating": 4.8},
      {"titulo": "Delicioso", "texto": "Massas incríveis e vinhos perfeitos.", "rating": 5.0},
      {"titulo": "Especial", "texto": "Noite maravilhosa com meu parceiro.", "rating": 4.9},
      {"titulo": "Recomendo", "texto": "Ideal para celebrações românticas.", "rating": 5.0},
    ],
    "Teatro Tobias Barreto": [
      {"titulo": "Cultural", "texto": "Espetáculo incrível, adoramos a experiência.", "rating": 5.0},
      {"titulo": "Romântico", "texto": "Ótimo para uma noite cultural a dois.", "rating": 4.8},
      {"titulo": "Elegante", "texto": "Ambiente sofisticado e acolhedor.", "rating": 5.0},
      {"titulo": "Especial", "texto": "Uma noite inesquecível com meu amor.", "rating": 4.9},
      {"titulo": "Recomendo", "texto": "Ideal para casais que apreciam arte.", "rating": 5.0},
    ],
    "Galeria Álvaro Santos": [
      {"titulo": "Inspirador", "texto": "Arte incrível, adoramos o passeio.", "rating": 5.0},
      {"titulo": "Tranquilo", "texto": "Ambiente calmo e perfeito para casais.", "rating": 4.8},
      {"titulo": "Cultural", "texto": "Ótimo para quem aprecia arte e cultura.", "rating": 5.0},
      {"titulo": "Especial", "texto": "Passeio único e cheio de inspiração.", "rating": 4.9},
      {"titulo": "Recomendo", "texto": "Ideal para casais que gostam de arte.", "rating": 5.0},
    ],
  };

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _comentarioController = TextEditingController();
  double _novaAvaliacao = 3.0;

  void _adicionarComentario(String local) {
    if (_tituloController.text.isNotEmpty && _comentarioController.text.isNotEmpty) {
      setState(() {
        comentariosPorLocal.putIfAbsent(local, () => []).add({
          "titulo": _tituloController.text,
          "texto": _comentarioController.text,
          "rating": _novaAvaliacao,
        });
        _tituloController.clear();
        _comentarioController.clear();
        _novaAvaliacao = 3.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;
    final comentarios = comentariosPorLocal[widget.titulo] ?? [];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imagem,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 250,
                color: Colors.grey[300],
                child: Icon(Icons.image_not_supported),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.titulo,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(widget.detalhes, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 24),
                  Text(
                    "Comentários e Avaliações",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...comentarios.map((comentario) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                comentario["titulo"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    comentario["rating"].toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(Icons.star, color: Colors.amber, size: 20),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            comentario["texto"],
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Avalie este local"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _tituloController,
                                  decoration: InputDecoration(
                                    labelText: "Título da avaliação",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _comentarioController,
                                  decoration: InputDecoration(
                                    labelText: "Comentário",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                RatingBar.builder(
                                  initialRating: _novaAvaliacao,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    _novaAvaliacao = rating;
                                  },
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancelar"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _adicionarComentario(widget.titulo);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF8E2321), // Fundo vinho
                                  foregroundColor: Colors.white, // Texto branco
                                ),
                                child: Text("Enviar"),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8E2321), // Fundo vinho
                        foregroundColor: Colors.white, // Texto branco
                        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Avalie esse local",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}