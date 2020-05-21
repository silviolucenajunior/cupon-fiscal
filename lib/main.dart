import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(
    MeuCuponApp()
  );
}

class MeuCuponApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Cupon',
      theme: _getTheme(),
      home: MeuCuponMainPage()
    );
  }

  ThemeData _getTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity
    );
  }
}

class MeuCuponMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Cupon"),
      ),
      body: Center(
        child: Text("Hola"),
      ),
    );
  }
}