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

  void removerConteudo(int index) {
    setState(() {
      conteudoLista.removeAt(index);
    });

    
  }

  void editarConteudo(int index, String title, String desc, String link) {
    setState(() {
      conteudoLista[index].titulo = title;
      conteudoLista[index].descricao = desc;
      conteudoLista[index].imgLink = link;
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
                  leading: Image.network(
                    conteudoLista[index].imgLink,

                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Image.network('https://blog.springshare.com/wp-content/uploads/2010/02/nc-md.gif'); // Ícone de erro personalizado
                    },

                    ),
                  title: Text(conteudoLista[index].titulo),
                  subtitle: Text(conteudoLista[index].descricao),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        color: Color.fromARGB(255, 255, 112, 102),
                        icon:const Icon(Icons.delete),
                        onPressed:() {
                          removerConteudo(index);
                        },
                      ),
                      IconButton(
                        color: Color.fromARGB(255, 80, 80, 80),
                        icon:const Icon(Icons.edit),
                        onPressed:() {
                          editDialog(context, index, conteudoLista[index].titulo, conteudoLista[index].descricao, conteudoLista[index].imgLink);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    print('voce clicou no livro: '+conteudoLista[index].titulo);
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  onPressed: ()   {
                    addDialog(context);
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

  //adicionar dialog
  void addDialog(BuildContext context) {
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

  //editar dialog
  void editDialog(BuildContext context, int indice, String titulo, String desc, String link) {
    TextEditingController _textEditingController1 = TextEditingController(text:titulo);
    TextEditingController _textEditingController2 = TextEditingController(text:desc);
    TextEditingController _textEditingController3 = TextEditingController(text:link);

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

              editarConteudo(indice, titulo, desc, link);

              Navigator.of(context).pop();
            },
            child: Text('Adicionar'),
            ),

        ],
      )
    );
  }
    


    

}

