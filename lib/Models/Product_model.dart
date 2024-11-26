class Product {
  int? id;
  int? userId;
  String? nome;
  String? categoria;
  String? marca;
  String? descricao;
  int? preco;
  String? img;

  Product(
      {this.id,
      this.userId,
      this.nome,
      this.categoria,
      this.marca,
      this.descricao,
      this.preco,
      this.img});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nome = json['nome'];
    categoria = json['categoria'];
    marca = json['marca'];
    descricao = json['descricao'];
    preco = json['preco'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['nome'] = this.nome;
    data['categoria'] = this.categoria;
    data['marca'] = this.marca;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['img'] = this.img;
    return data;
  }
}