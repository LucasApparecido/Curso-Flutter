// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns, sua pontuação foi: $pontuacao';
    } else if (pontuacao < 12) {
      return 'Você é bom!, sua pontuação foi:  $pontuacao';
    } else if (pontuacao < 16) {
      return 'Impressionante!, sua pontuação foi:  $pontuacao';
    } else {
      return 'Nível Jedi!, sua pontuação foi:  $pontuacao';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Tentar Novamente??',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
