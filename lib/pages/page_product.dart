import 'package:evistore/Controllers/Users_controller.dart';
import 'package:evistore/Controllers/cart_controller.dart';
import 'package:evistore/Http/Http_Request.dart';
import 'package:evistore/Models/Cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class PageProduct extends StatefulWidget {

  @override
  State<PageProduct> createState() => _PageProductState();
}

class _PageProductState extends State<PageProduct> {
  final CartController _controller = CartController();
  final UsersController _usersController = Get.put(UsersController());
  var _count = 1.obs;

  @override
  void initState() {
    _usersController.pegarDadosUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> args = Get.arguments;
    final int id = args["id"]; 
    final String avatar = args["avatar"];
    final String nome = args["nome"];
    final int preco = args["preco"];
    final String desc = args["desc"];
    final String cate = args["cate"];

     String IMG_URL = HttpRequest.IMG_URL;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detalhes do produto",style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          Icon(Icons.favorite,color: Colors.red,),
          SizedBox(width: 20,)
        ],
      ),
      body: Expanded(
        child: ListView(
          children: [
            Image.network(IMG_URL+avatar,
            height: 220,
            fit: BoxFit.cover,
            width: double.infinity,
            ),
            Expanded(
              child: Container(
               width: double.infinity,
                decoration: BoxDecoration(
                   //color: Colors.grey.withOpacity(0.1),
                  //borderRadius: BorderRadius.only(
                    //topLeft: Radius.circular(30),
                    //topRight: Radius.circular(30))
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text("$nome",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),) 
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                color:  Colors.red,
                                child: Text(preco.toString()+ " Kz",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Divider(),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.yellow,),
                            Icon(Icons.star,color: Colors.yellow,),
                            Icon(Icons.star,color: Colors.yellow,),
                            Icon(Icons.star,color: Colors.yellow,),
                            Icon(Icons.star,color: Colors.yellow,),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          child: Text(cate,style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                          textAlign: TextAlign.left,),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child:  Text("$desc")
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
      Container(
        //color: Colors.grey.withOpacity(0.1),
        height: 130,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Divider(),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.grey.withOpacity(0.4),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                _controller.decrement();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(Icons.remove,color: Colors.white,)
                              ),
                            ),
                            SizedBox(width: 10,),
                            Obx((){
                              _count.value = _controller.contador.value;
                              print(_count);
                              return Text(_controller.contador.value.toString(),style: TextStyle(
                                fontSize: 25,
                              ),);
                            },),
                            SizedBox(width: 10,),
                             InkWell(
                                onTap: () {
                                  _controller.increment();
                                },
                               child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(Icons.add,color: Colors.white,)
                                                       ),
                             ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  final carts = CartModel(
                    idProd: id,
                    img: avatar,
                    nome: nome,
                    preco: preco,
                    qty: _controller.contador.value,
                    idUser: _usersController.id.value
                  );
                  _controller.adicionarCarrinho(carts);
                  //Navigator.of(context).pop();
                }, 
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Obx(() {
                    if (_controller.loading.value) {
                      return Container(
                       
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }else {
                      return Text("Add ao carrinho",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),);
                    }
                  },)
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}