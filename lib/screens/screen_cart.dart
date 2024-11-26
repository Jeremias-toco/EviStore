import 'package:evistore/Components/Not_connection.dart';
import 'package:evistore/Components/loading.dart';
import 'package:evistore/Controllers/Cart_controller.dart';
import 'package:evistore/Controllers/Users_controller.dart';
import 'package:evistore/Http/Http_Request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenCart extends StatefulWidget {
  const ScreenCart({super.key});

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {

  final CartController _cartController = Get.put(CartController());
  final UsersController _usersController = Get.put(UsersController());
  String IMG_URL = HttpRequest.IMG_URL;

  @override
  void initState() {
    _usersController.pegarDadosUsuario();
    print(_usersController.id.value);
    _cartController.listarCarrinho(_usersController.id.value);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Carrinho de compras",
          style: TextStyle(
            fontSize: 20  
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              _cartController.listarCarrinho(_usersController.id.value);
            },
            child: Icon(Icons.refresh,size: 40,)
          ),
          SizedBox(width: 30,)
        ],
      ),
      body: Obx(() {
        if (_cartController.loading.value) {
          return Loading();
        } else if(_cartController.listaCarrinho.isNotEmpty){
          return _listacarrinho();
        }else {
          return Container();
        }
      },)
    );
  }

  _listacarrinho(){
    return Column(
        children: [
          SizedBox(height: 5,),
            Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total de itens: "+_cartController.listaCarrinho.length.toString(),style: TextStyle(
                  
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height - 350,
            child: ListView.builder(
              itemCount: _cartController.listaCarrinho.length,
              itemBuilder: (context, index) {
                var item = _cartController.listaCarrinho[index];
              return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(4, 4)
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image:NetworkImage(IMG_URL + item.img.toString()),
                          fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 140,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(item.nome.toString(),
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 10,),
                            Text(item.preco.toString()+"Kz x "+item.qty.toString(),style: TextStyle(
                              fontSize: 16,
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 40,),
                    Positioned(
                     left: 40,
                      child: InkWell(
                        onTap: () {
                          _cartController.apagarCarrinho(item.id!);
                          _cartController.listaCarrinho.clear();
                          _cartController.listarCarrinho(_usersController.id.value);
                        },
                        child: Icon(Icons.delete,color: Colors.red,size: 30,
                        ),
                      )
                    )
                  ],
                ),
              ),
            );
            },),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child:Container(
              decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.red,
                  width: 1,
                )
              )
            ),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                   Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total á pagar",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                        Text(_cartController.totalCarrinho.value.toString()+",00 Kz",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: (){
                          //Get.toNamed("/pay");
                          Get.snackbar("Erro", "D/InputConnectionAdaptor(10774): The input method toggled cursor monitoring off"+
"D InputMethodManager(10774) showSoftInput() )");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red)
                        ), 
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Comprar agora",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
  }
}