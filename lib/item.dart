class Item {
  String titulo;
  String descricao;
  String imgLink;

  Item({required this.titulo, required this.descricao, required this.imgLink});

  // factory Item.fromJson(Map<String, dynamic> json) {
  //   return Item(
  //     titulo: json['titulo'],
  //     descricao: json['descricao'],
  //   );
  // }
}