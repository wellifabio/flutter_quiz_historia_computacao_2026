import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontos;
  final int? total;
  final String? nome;
  const Result({super.key, required this.pontos, this.total, this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultado")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            Text(
              "Parabéns ${nome ?? ''} você acertou $pontos questões \nde um total de ${total ?? 0} questões",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: Text("Reiniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
