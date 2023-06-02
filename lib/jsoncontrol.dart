import 'dart:convert';
import 'dart:io';
import 'item.dart';

List<Item> conteudoLista = [Item(titulo:"livro1",descricao: "descricao 1", imgLink: 'bla bla')];

void adicionar(String title, String desc, String link) {
    conteudoLista.add(Item(titulo: title, descricao: desc, imgLink: link));
  }
