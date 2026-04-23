import 'package:flutter/material.dart';
import '/root/theme.dart';
import '/ui/splash.dart';

void main() {
  runApp(
    MaterialApp(title: "Papelaria", theme: AppTheme.appTeme, home: Splash()),
  );
}

//Progresso linear com bordas arredondadas
// ClipRRect(
//   borderRadius: BorderRadius.all(Radius.circular(10)), // Arredonda as bordas
//   child: LinearProgressIndicator(
//     value: 0.7, // 70% de progresso
//     minHeight: 15, // Altura da barra
//     backgroundColor: Colors.grey[300],
//     color: Colors.blue, // Cor do progresso
//   ),
// )
