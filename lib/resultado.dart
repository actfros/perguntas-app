import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontos, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontos < 35) {
      return 'Parabéns!!';
    } else if (pontos < 45) {
      return 'Você é bom!!';
    } else if (pontos < 55) {
      return 'Impressionante!!';
    } else {
      return 'Nível Jedi!!';
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
            style: TextStyle(fontSize: 28),
          ),
        ),
        Text(
          '\nPontos: $pontos',
          style: TextStyle(
            fontSize: 28,
            color: Color(0xFF6ae792),
          ),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
