import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto' : 'Azul','pontos': 10},
        {'texto' : 'Preto','pontos': 20},
        {'texto' : 'Branco','pontos': 15},
        {'texto' : 'Verde','pontos': 25},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto':'Gato','pontos': 10},
        {'texto':'Cachorro','pontos': 25},
        {'texto':'Pássaro','pontos': 20},
        {'texto':'Tartaruga','pontos': 15},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto':'Poseidon','pontos': 25},
        {'texto':'Hades','pontos': 10},
        {'texto':'Ares','pontos': 20},
        {'texto':'Zeus','pontos': 15},
      ],
    },
  ];

  void _responder(int pontos) {
    setState(() {

      _perguntaSelecionada++;
      _pontuacaoTotal += pontos;
    });

  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });

  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
