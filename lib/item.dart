class Item {
  final String titulo;
  final String descricao;
  final String imgLink;

  Item({required this.titulo, required this.descricao, required this.imgLink});

  // factory Item.fromJson(Map<String, dynamic> json) {
  //   return Item(
  //     titulo: json['titulo'],
  //     descricao: json['descricao'],
  //   );
  // }
}