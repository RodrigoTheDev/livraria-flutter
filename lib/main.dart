import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'item.dart';
import 'jsoncontrol.dart';
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}



class _MyAppState extends State<MyApp> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void adicionarConteudo(String title, String desc, String link) {
    setState(() {
      conteudoLista.add(Item(titulo: title, descricao: desc, imgLink:link));
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Livraria'),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: conteudoLista.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('R')),
                  title: Text(conteudoLista[index].titulo),
                  subtitle: Text(conteudoLista[index].descricao),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  onPressed: ()   {
                    openDialog(context);
                    // abrirModal(context);
                    // adicionarConteudo('sonic', 'bla');
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );


  }


  void openDialog(BuildContext context) {
    print('bla');
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
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Livro'),
        content: Column(
          
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

        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('cancelar')
          ),
          TextButton(
            onPressed: () {
              //ação do botao
              String titulo = _textEditingController1.text;
              String desc = _textEditingController2.text;
              String link = _textEditingController3.text;

              adicionarConteudo(titulo, desc, link);

              Navigator.of(context).pop();
            },
            child: Text('Adicionar'),
            ),

        ],
      )
    );

  }
    


    

}

