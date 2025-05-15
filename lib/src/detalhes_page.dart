import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'themes/custom_colors.dart';

class DetalhesPage extends StatefulWidget {
  // Propriedades recebidas para exibir os detalhes do local
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
  // Mapa que armazena os comentários organizados por local
  final Map<String, List<Map<String, dynamic>>> comentariosPorLocal = {
    "Calçadão 13 de Julho": [
      {"titulo": "Romântico", "texto": "Passeio perfeito ao pôr do sol com meu amor.", "rating": 5.0, "autor": 2},
      {"titulo": "Tranquilo", "texto": "Caminhada relaxante e ótima para conversar.", "rating": 4.5, "autor": 2},
      {"titulo": "Vista incrível", "texto": "A vista do rio é maravilhosa, adoramos!", "rating": 5.0, "autor": 2},
      {"titulo": "Agradável", "texto": "Lugar calmo para momentos a dois.", "rating": 4.0, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ótimo para casais que gostam de natureza.", "rating": 5.0, "autor": 2},
    ],
    "Crôa do Goré": [
      {"titulo": "Relaxante", "texto": "Dia incrível com meu parceiro, super tranquilo.", "rating": 4.5, "autor": 2},
      {"titulo": "Paisagem", "texto": "Vista linda, perfeito para casais.", "rating": 5.0, "autor": 2},
      {"titulo": "Natureza", "texto": "Contato direto com a natureza, adoramos!", "rating": 4.0, "autor": 2},
      {"titulo": "Tranquilidade", "texto": "Ambiente calmo e romântico.", "rating": 4.8, "autor": 2},
      {"titulo": "Encantador", "texto": "Um dos melhores lugares para casais.", "rating": 5.0, "autor": 2},
    ],
    "Eco Parque": [
      {"titulo": "Natureza", "texto": "Passeio tranquilo e romântico no meio da natureza.", "rating": 4.0, "autor": 2},
      {"titulo": "Agradável", "texto": "Ótimo para piqueniques a dois.", "rating": 4.5, "autor": 2},
      {"titulo": "Trilhas", "texto": "Caminhamos juntos e foi maravilhoso.", "rating": 4.0, "autor": 2},
      {"titulo": "Calmo", "texto": "Ambiente perfeito para relaxar com meu amor.", "rating": 4.5, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ideal para casais que gostam de natureza.", "rating": 4.8, "autor": 2},
    ],
    "Ilha dos Namorados": [
      {"titulo": "Romântico", "texto": "Lugar perfeito para casais, adoramos a exclusividade.", "rating": 5.0, "autor": 2},
      {"titulo": "Exclusivo", "texto": "Praia tranquila e reservada, muito especial.", "rating": 4.8, "autor": 2},
      {"titulo": "Beleza", "texto": "Paisagem deslumbrante, momentos inesquecíveis.", "rating": 5.0, "autor": 2},
      {"titulo": "Especial", "texto": "Um lugar único para casais apaixonados.", "rating": 4.9, "autor": 2},
      {"titulo": "Recomendo", "texto": "Vale muito a pena visitar com quem você ama.", "rating": 5.0, "autor": 2},
    ],
    "Orla Pôr do Sol": [
      {"titulo": "Lindo", "texto": "Pôr do sol inesquecível com meu parceiro.", "rating": 5.0, "autor": 2},
      {"titulo": "Atmosfera", "texto": "Clima perfeito para relaxar juntos.", "rating": 4.7, "autor": 2},
      {"titulo": "Romântico", "texto": "Ideal para casais, adoramos o cenário.", "rating": 5.0, "autor": 2},
      {"titulo": "Encantador", "texto": "Vista incrível, momentos mágicos.", "rating": 5.0, "autor": 2},
      {"titulo": "Recomendo", "texto": "Um dos melhores lugares para casais.", "rating": 4.8, "autor": 2},
    ],
    "Parque da Sementeira": [
      {"titulo": "Tranquilo", "texto": "Ótimo para piqueniques a dois.", "rating": 4.5, "autor": 2},
      {"titulo": "Natureza", "texto": "Contato com a natureza, perfeito para casais.", "rating": 4.8, "autor": 2},
      {"titulo": "Relaxante", "texto": "Ambiente calmo e romântico.", "rating": 4.7, "autor": 2},
      {"titulo": "Agradável", "texto": "Passeio maravilhoso com meu amor.", "rating": 5.0, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ideal para momentos tranquilos a dois.", "rating": 5.0, "autor": 2},
    ],
    "Passarela do Caranguejo": [
      {"titulo": "Divertido", "texto": "Ótimo lugar para casais que gostam de boa comida.", "rating": 4.5, "autor": 2},
      {"titulo": "Animado", "texto": "Clima descontraído e perfeito para um encontro.", "rating": 4.8, "autor": 2},
      {"titulo": "Gastronomia", "texto": "Comida deliciosa, adoramos o ambiente.", "rating": 5.0, "autor": 2},
      {"titulo": "Especial", "texto": "Noite incrível com meu parceiro.", "rating": 4.9, "autor": 2},
      {"titulo": "Recomendo", "texto": "Perfeito para casais que gostam de diversão.", "rating": 5.0, "autor": 2},
    ],
    "Praça Fausto Cardoso": [
      {"titulo": "Histórico", "texto": "Passeio tranquilo e cheio de história.", "rating": 4.5, "autor": 2},
      {"titulo": "Charmoso", "texto": "Lugar calmo e perfeito para casais.", "rating": 4.8, "autor": 2},
      {"titulo": "Agradável", "texto": "Adoramos caminhar juntos por aqui.", "rating": 5.0, "autor": 2},
      {"titulo": "Relaxante", "texto": "Ótimo para momentos tranquilos a dois.", "rating": 4.9, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ambiente perfeito para casais.", "rating": 5.0, "autor": 2},
    ],
    "Rio Vaza Barris": [
      {"titulo": "Aventura", "texto": "Passeio de caiaque incrível com meu amor.", "rating": 5.0, "autor": 2},
      {"titulo": "Natureza", "texto": "Contato direto com a natureza, adoramos!", "rating": 4.8, "autor": 2},
      {"titulo": "Tranquilo", "texto": "Ambiente calmo e romântico.", "rating": 4.7, "autor": 2},
      {"titulo": "Especial", "texto": "Experiência única e inesquecível.", "rating": 5.0, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ideal para casais aventureiros.", "rating": 5.0, "autor": 2},
    ],
    "Le Café": [
      {"titulo": "Aconchegante", "texto": "Ambiente perfeito para um café a dois.", "rating": 5.0, "autor": 2},
      {"titulo": "Charmoso", "texto": "Lugar tranquilo e romântico.", "rating": 4.8, "autor": 2},
      {"titulo": "Delicioso", "texto": "Cafés incríveis e sobremesas deliciosas.", "rating": 5.0, "autor": 2},
      {"titulo": "Especial", "texto": "Ótimo para conversas e momentos juntos.", "rating": 4.9, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ideal para casais que gostam de cafés especiais.", "rating": 5.0, "autor": 2},
    ],
    "La Tavola Trattoria": [
      {"titulo": "Romântico", "texto": "Jantar à luz de velas inesquecível.", "rating": 5.0, "autor": 2},
      {"titulo": "Sofisticado", "texto": "Ambiente elegante e acolhedor.", "rating": 4.8, "autor": 2},
      {"titulo": "Delicioso", "texto": "Massas incríveis e vinhos perfeitos.", "rating": 5.0, "autor": 2},
      {"titulo": "Especial", "texto": "Noite maravilhosa com meu parceiro.", "rating": 4.9, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ideal para celebrações românticas.", "rating": 5.0, "autor": 2},
    ],
    "Teatro Tobias Barreto": [
      {"titulo": "Cultural", "texto": "Espetáculo incrível, adoramos a experiência.", "rating": 5.0, "autor": 2},
      {"titulo": "Romântico", "texto": "Ótimo para uma noite cultural a dois.", "rating": 4.8, "autor": 2},
      {"titulo": "Elegante", "texto": "Ambiente sofisticado e acolhedor.", "rating": 5.0, "autor": 2},
      {"titulo": "Especial", "texto": "Uma noite inesquecível com meu amor.", "rating": 4.9, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ideal para casais que apreciam arte.", "rating": 5.0, "autor": 2},
    ],
    "Galeria Álvaro Santos": [
      {"titulo": "Inspirador", "texto": "Arte incrível, adoramos o passeio.", "rating": 5.0, "autor": 2},
      {"titulo": "Tranquilo", "texto": "Ambiente calmo e perfeito para casais.", "rating": 4.8, "autor": 2},
      {"titulo": "Cultural", "texto": "Ótimo para quem aprecia arte e cultura.", "rating": 5.0, "autor": 2},
      {"titulo": "Especial", "texto": "Passeio único e cheio de inspiração.", "rating": 4.9, "autor": 2},
      {"titulo": "Recomendo", "texto": "Ideal para casais que gostam de arte.", "rating": 5.0, "autor": 2},
    ],
  };

  // Identificador do usuário atual
  final String usuarioAtual = "usuario1";

  // Controladores para os campos de texto
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _comentarioController = TextEditingController();

  // Avaliação inicial para novos comentários
  double _novaAvaliacao = 3.0;

  // Adiciona um novo comentário ao local atual
  void _adicionarComentario(String local) {
    if (_tituloController.text.isNotEmpty && _comentarioController.text.isNotEmpty) {
      setState(() {
        comentariosPorLocal.putIfAbsent(local, () => []).add({
          "titulo": _tituloController.text,
          "texto": _comentarioController.text,
          "rating": _novaAvaliacao,
          "autor": usuarioAtual,
        });
        // Limpa os campos após adicionar
        _tituloController.clear();
        _comentarioController.clear();
        _novaAvaliacao = 3.0;
      });
    }
  }

  // Edita um comentário existente, verificando se o autor é o usuário atual
  void _editarComentario(String local, int index) {
    final comentario = comentariosPorLocal[local]![index];
    if (comentario["autor"] != usuarioAtual) return;

    // Preenche os campos com os dados do comentário para edição
    _tituloController.text = comentario["titulo"];
    _comentarioController.text = comentario["texto"];
    _novaAvaliacao = comentario["rating"];

    // Exibe um diálogo para editar o comentário
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Editar Comentário"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Campo para editar o título
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: "Título da avaliação",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Campo para editar o texto do comentário
            TextField(
              controller: _comentarioController,
              decoration: InputDecoration(
                labelText: "Comentário",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Componente para editar a avaliação
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
          // Botão para cancelar a edição
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
          // Botão para salvar as alterações
          ElevatedButton(
            onPressed: () {
              setState(() {
                comentariosPorLocal[local]![index] = {
                  "titulo": _tituloController.text,
                  "texto": _comentarioController.text,
                  "rating": _novaAvaliacao,
                  "autor": usuarioAtual,
                };
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF8E2321),
              foregroundColor: Colors.white,
            ),
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }

  // Remove um comentário, verificando se o autor é o usuário atual
  void _removerComentario(String local, int index) {
    final comentario = comentariosPorLocal[local]![index];
    if (comentario["autor"] != usuarioAtual) return;

    setState(() {
      comentariosPorLocal[local]!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Obtém os comentários do local atual
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
            // Exibe a imagem do local
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
                  // Título do local
                  Text(
                    widget.titulo,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  // Seção de comentários
                  Text(
                    "Comentários e Avaliações",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Lista de comentários
                  ...comentarios.asMap().entries.map((entry) {
                    final index = entry.key;
                    final comentario = entry.value;

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Título do comentário
                                Text(
                                  comentario["titulo"],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Avaliação com estrelas
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
                            // Texto do comentário
                            Text(
                              comentario["texto"],
                              style: TextStyle(fontSize: 16),
                            ),
                            // Botões de editar e remover, se o autor for o usuário atual
                            if (comentario["autor"] == usuarioAtual)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.grey),
                                    onPressed: () => _editarComentario(widget.titulo, index),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.grey),
                                    onPressed: () => _removerComentario(widget.titulo, index),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  // Botão para adicionar um novo comentário
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
                                // Campo para o título do comentário
                                TextField(
                                  controller: _tituloController,
                                  decoration: InputDecoration(
                                    labelText: "Título da avaliação",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Campo para o texto do comentário
                                TextField(
                                  controller: _comentarioController,
                                  decoration: InputDecoration(
                                    labelText: "Comentário",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Componente para selecionar a avaliação
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
                              // Botão para cancelar
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancelar"),
                              ),
                              // Botão para enviar o comentário
                              ElevatedButton(
                                onPressed: () {
                                  _adicionarComentario(widget.titulo);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF8E2321),
                                  foregroundColor: Colors.white,
                                ),
                                child: Text("Enviar"),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8E2321),
                        foregroundColor: Colors.white,
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