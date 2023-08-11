import 'package:flutter/material.dart';
import 'dart:math';

main() {
  runApp(QuizApp());
}

class QuizAppState extends State<QuizApp> {
  var perguntaSelecionada = 0;
  int pontos = 0;
  var listaSorteio = [0, 0, 0];
  int nSorteio = -1;

  void sorteio() {

    listaSorteio[0] = Random().nextInt(3);
    nSorteio = Random().nextInt(3); 

    while (listaSorteio[0] == nSorteio) {
      nSorteio = Random().nextInt(3);
    }
    listaSorteio[1] = nSorteio;
    
    nSorteio = Random().nextInt(3);
    while (listaSorteio[0] == nSorteio || listaSorteio[1] == nSorteio) {
      nSorteio = Random().nextInt(3);
    }
    listaSorteio[2] = nSorteio;      

    print(listaSorteio);    
  }

  void responder() {
    setState(() {
      perguntaSelecionada++;
      sorteio();
    });
  }

  @override
  Widget build(BuildContext context) {
    sorteio();
    final List<String> perguntas = [
      'Qual a cor de cavalo de Napoleão?',
      'Em que ano o Brasil ganhou a última copa?',
      'Qual a capital do Brasil?',
    ];
    final List<String> respostas0 = [
      'Branco',
      'Preto',
      'Caramelo',
    ];
    final List<String> respostas1 = [
      '2002',
      '1994',
      '1998',
    ];
    final List<String> respostas2 = [
      'Brasília',
      'Buenos Aires',
      'Rio de Janeiro',
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('App Quiz'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(perguntas[perguntaSelecionada], style: TextStyle(fontStyle: FontStyle.italic),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
              onPressed: responder,
              child: Text(perguntaSelecionada == 0
                  ? respostas0[listaSorteio[0]]
                  : perguntaSelecionada == 1
                      ? respostas1[listaSorteio[0]]
                      : respostas2[listaSorteio[0]]),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
              child: Text(perguntaSelecionada == 0
                  ? respostas0[listaSorteio[1]]
                  : perguntaSelecionada == 1
                      ? respostas1[listaSorteio[1]]
                      : respostas2[listaSorteio[1]]),
              onPressed: responder,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  side: const BorderSide(width: 3, color: Colors.brown),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.all(20)),
              child: Text(perguntaSelecionada == 0
                  ? respostas0[listaSorteio[2]]
                  : perguntaSelecionada == 1
                      ? respostas1[listaSorteio[2]]
                      : respostas2[listaSorteio[2]]),
              onPressed: responder,
            ),
          ],
        ),
      ),
    ));
  }
}

class QuizApp extends StatefulWidget {
  QuizAppState createState() {
    return QuizAppState();
  }
}
