import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../root/colors.dart';
import 'result.dart';

class Home extends StatefulWidget {
  final String? nome;
  const Home({super.key, this.nome});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> perguntas = [];
  int indice = 0, pontos = 0, opcao = -1;
  bool respondendo = true;

  ValueChanged<dynamic>? get onChanged => null;

  @override
  void initState() {
    super.initState();
    carrearMockupJSON();
  }

  Future<void> carrearMockupJSON() async {
    String dados = await rootBundle.loadString('assets/mockups/perguntas.json');
    setState(() {
      perguntas = json.decode(dados);
    });
  }

  void responder() {
    if (perguntas[indice]['correta'] - 1 == opcao) {
      pontos++;
      msgDialog("Resposta correta", "Parabéns, você acertou!");
    } else {
      msgDialog("Resposta errada", "Que pena você errou");
    }
    setState(() {
      respondendo = false;
    });
  }

  void proxima() {
    if (indice < perguntas.length - 1) {
      setState(() {
        indice++;
        respondendo = true;
        opcao = -1;
      });
    } else {
      irParaResult();
    }
  }

  void irParaResult() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Result(pontos: pontos, total: perguntas.length, nome: widget.nome),
      ),
    );
  }

  void msgDialog(String titulo, String texto) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(titulo),
          content: Text(texto),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Fechar"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("História da computação")),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: perguntas.isEmpty
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Text(
                    "Questão nº ${indice + 1}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: AppColors.p4,
                    foregroundImage: NetworkImage(
                      perguntas[indice]['ilustracao'].toString(),
                    ),
                    child: Icon(Icons.computer, size: 50, color: AppColors.p1),
                  ),
                  Text(
                    perguntas[indice]['pergunta'],
                    textAlign: TextAlign.center,
                  ),
                  RadioGroup<int>(
                    onChanged: (value) => setState(() {
                      opcao = value!;
                    }),
                    groupValue: opcao,
                    child: Column(
                      children: [
                        ...List.generate(
                          perguntas[indice]['respostas'].length,
                          (i) => RadioListTile(
                            title: Text(perguntas[indice]['respostas'][i]),
                            value: i,
                            enabled: respondendo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: opcao == -1 || !respondendo ? null : responder,
                    child: Text("Responder"),
                  ),
                  ElevatedButton(
                    onPressed: respondendo ? null : proxima,
                    child: Text(
                      indice < perguntas.length - 1
                          ? "Próxima questão"
                          : "Concluir",
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
