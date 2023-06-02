import 'package:flutter/material.dart';
import 'myDialogue.dart';
import 'jsoncontrol.dart';

void main() {
  runApp(adicionarLivro());
}

class adicionarLivro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inputs de Texto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _textEditingController3 = TextEditingController();

  @override
  void dispose() {
    _textEditingController1.dispose();
    _textEditingController2.dispose();
    _textEditingController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController1,
              decoration: InputDecoration(labelText: 'Título do livro'),
            ),
            TextField(
              controller: _textEditingController2,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _textEditingController3,
              decoration: InputDecoration(labelText: 'link para capa'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                String text1 = _textEditingController1.text;
                String text2 = _textEditingController2.text;
                String text3 = _textEditingController3.text;

                // Faça algo com os valores dos campos de texto
                print('Campo 1: $text1');
                print('Campo 2: $text2');
                print('Campo 3: $text3');

                abrirModal(context);
                
                
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  void abrirModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog();
      },
    );
  }
}