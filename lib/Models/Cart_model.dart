
class CartModel{
  int? id;
  int? idProd;
  int? idUser;
  String? nome;
  int? preco;
  String? img;
  int? qty;

  CartModel({
    this.id,
    this.idProd,
    this.idUser,
    this.nome,
    this.img,
    this.preco,
    this.qty
  });

  CartModel.fromJson(Map<String, dynamic>json){
    id = json["id"];
    idProd = json["id_prod"];
    idUser = json["id_user"];
    nome = json["nome"];
    img = json["img"];
    preco = json["preco"];
    qty = json["qty"];
  }

  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data["id"] = id;
    data["id_prod"] = idProd;
    data["id_user"] = idUser;
    data["nome"] = nome;
    data["img"] = img;
    data["preco"] = preco;
    data["qty"] = qty;
    
    return data;
  }

}





// "id": 5,
// "id_prod": 10,
// "id_user": 1,
// "nome": "Auicular BT",
// "categoria": "Electrodoméstico",
// "descricao": "Auicular BT é umaparelho revolucionáro de mais alta qualidade",
// "preco": 100000,
// "created_at": "2023-02-06T21:35:02.000000Z",
// "updated_at": "2023-02-06T21:35:02.000000Z",
// "img": "b79857289ee18e7bed99c09a38023307.png",
// "qty": 0