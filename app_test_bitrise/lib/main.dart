import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases do dia',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Frases do dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _phrases = [
    "Primeira Frase",
    "Segunda Frase",
    "Terceira Frase",
    "Quarta Frase"
  ];

  var _initialPhrase = "Nenhuma frase foi criada";

  void _phraseGenerate() {
    int _number = Random().nextInt(_phrases.length);
    setState(() {
      _initialPhrase = _phrases[_number];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clique no botão para gerar uma nova frase',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_initialPhrase',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
                onPressed: _phraseGenerate, child: Text("Gerar nova frase"))
          ],
        ),
      ),
    );
  }
}
