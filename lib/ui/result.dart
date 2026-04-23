import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../root/file.dart';

class Result extends StatefulWidget {
  final int pontos;
  final int? total;
  final String? nome;
  const Result({super.key, required this.pontos, this.total, this.nome});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final fileManager = FileManager();
  String fileData = "";

  @override
  initState() {
    super.initState();
    loadResults();
  }

  void saveResult() async {
    fileData +=
        "${DateTime.now()}, ${widget.nome}, ${widget.pontos}, ${widget.total}\n";
    await fileManager.writeData(fileData);
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Resultado salvo com sucesso!")));
    }
    loadResults();
  }

  void limparArquivo() async {
    await fileManager.writeData("");
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Resultados limpos com sucesso!")));
    }
    loadResults();
  }

  void loadResults() async {
    String data = await fileManager.readData();
    setState(() {
      fileData = data;
    });
  }

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
              "Parabéns ${widget.nome ?? ''} você acertou ${widget.pontos} questões \nde um total de ${widget.total ?? 0} questões",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: saveResult, child: Text("Salvar")),
                ElevatedButton(onPressed: limparArquivo, child: Text("Limpar")),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: Text("Encerrar"),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.all(18.0), child: Text(fileData)),
          ],
        ),
      ),
    );
  }
}
