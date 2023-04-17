import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é o seu pokemon favorito?',
      'respostas': [
        {'texto': 'Lucario', 'pontuacao': 10},
        {'texto': 'Charmander', 'pontuacao': 5},
        {'texto': 'Treecko', 'pontuacao': 3},
        {'texto': 'Reshiram', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é a sua região favorita?',
      'respostas': [
        {'texto': 'Kalos', 'pontuacao': 10},
        {'texto': 'Kanto', 'pontuacao': 5},
        {'texto': 'Alola', 'pontuacao': 3},
        {'texto': 'Jhoto', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o tipo favorito?',
      'respostas': [
        {'texto': 'Sombrio', 'pontuacao': 10},
        {'texto': 'Fogo', 'pontuacao': 5},
        {'texto': 'Planta', 'pontuacao': 3},
        {'texto': 'Dragão', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
