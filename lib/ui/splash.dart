import 'package:flutter/material.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _entrada, _saida;
  double _x = 0, _y = 0;
  String? nome;

  @override
  void initState() {
    super.initState();
    movimentos();
    entrada();
  }

  void movimentos() {
    _entrada =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addListener(() {
            setState(() {
              _x = _entrada.value * 300 - 300;
              _y = _entrada.value * 500 - 500;
            });
          });

    _saida =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addListener(() {
            setState(() {
              _x = _saida.value * 300;
              _y = _saida.value * -500;
            });
          });
  }

  void resetAnimation() {
    _saida.reset();
    _entrada.reset();
    setState(() {
      _x = -300;
      _y = -500;
    });
  }

  void entrada() {
    _entrada.forward();
  }

  void saida() {
    _saida.forward().then((value) => irParaHome());
  }

  void irParaHome() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home(nome: nome!)),
    );
    resetAnimation();
    entrada();
  }

  @override
  void dispose() {
    super.dispose();
    _entrada.dispose();
    _saida.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Papelaria produtos")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            Transform.translate(
              offset: Offset(_x, _y),
              child: Image.asset('assets/icone.png', width: 150),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu nome',
                  hintText: 'Ex: Wellington Martins',
                ),
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
              ),
            ),
            ElevatedButton(onPressed: saida, child: Text("Entrar")),
          ],
        ),
      ),
    );
  }
}
