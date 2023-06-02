import 'package:flutter/material.dart';
import 'jsoncontrol.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
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
    return AlertDialog(
      title: Text('Adicionar Livro'),
      content: Container(
        // padding: EdgeInsets.all(0),
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

          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop(); // Fecha o diálogo
          },
        ),
        TextButton(
          child:Text('Adicionar'),
          onPressed: () {
            String titulo = _textEditingController1.text;
            String desc = _textEditingController2.text;
            String link = _textEditingController3.text;

            print('foi hihi');
            // adicionar(titulo, desc);
            print(conteudoLista.length);
          }
        ),
      ],
    );
  }
}