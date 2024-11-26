import 'package:card_loading/card_loading.dart';
import 'package:evistore/Components/CardProduct_component.dart';
import 'package:evistore/Components/header.dart';
import 'package:evistore/Components/searchBar_component.dart';
import 'package:evistore/Components/slide_component.dart';
import 'package:evistore/Controllers/Product_controller.dart';
import 'package:evistore/Controllers/Users_controller.dart';
import 'package:evistore/Http/Http_Request.dart';
import 'package:evistore/Models/Product_model.dart';
import 'package:evistore/pages/page_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_card/image_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final product = ProductController();
  static String IMG_URL = HttpRequest.IMG_URL;
  final controller = TextEditingController();
  final UsersController user = Get.put(UsersController());

  @override
  void initState() {
    product.listarProdutos();
    user.pegarDadosUsuario();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(product.loading.value){
          return _loading();
        }else if(product.produtos.isEmpty ){
          return _errorPage();
        }else{
         return _pageHome();
        }
      })
    );      
  }

  _pageHome(){
    return Container(
        child: ListView(
          children: [
            Obx(() {
              return HeaderComponent(nome: user.nome.value,);
            },),
            SizedBox(height: 10,),
            SearchbarComponent(
              onTap: () {
               Get.toNamed("/products");
              },
            ),
            SizedBox(height: 10,),
            SlideComponent(),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mais Recentes",
                  style: TextStyle(
                    fontSize: 19,   
                  ),),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/products");
                    },
                    child: Text("Ver Todos")
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 300,
              color: Colors.white,
              child: ListView.builder(
                itemCount: product.produtos.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = product.produtos[index];
                  return InkWell(
                      onTap: () {
                        Get.toNamed("/product",
                          arguments: {
                            "id" : item.id,
                            "avatar": item.img.toString(),
                            "nome": item.nome.toString(),
                            "preco": item.preco,
                            "desc": item.descricao.toString(),
                            "cate": item.categoria
                          }
                        );
                      },
                      child: CardproductComponent(
                        img: IMG_URL + item.img.toString(),
                        nome: item.nome.toString(),
                        desc: item.descricao.toString(),
                        preco: item.preco.toString(),
                      ),
                    );
              },),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mais Populares",
                  style: TextStyle(
                    fontSize: 19,
                    
                  ),),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/products");
                    },
                    child: Text("Ver Todos")
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: product.produtosPopulares.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                var item = product.produtosPopulares[index];
                return InkWell(
                  onTap: () {
                    Get.toNamed("/product",
                      arguments: {
                        "id" : item.id,
                        "avatar": item.img.toString(),
                        "nome": item.nome.toString(),
                        "preco": item.preco,
                        "desc": item.descricao.toString(),
                        "cate": item.categoria,
                      }
                    );
                  },
                  child: CardproductComponent(
                    img: IMG_URL + item.img.toString(),
                    nome: item.nome.toString(),
                    desc: item.descricao.toString(),
                    preco: item.preco.toString(),
                  ),
                );
              },),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mais Comprados",
                  style: TextStyle(
                    fontSize: 19,
                    
                  ),),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/products");
                    },
                    child: Text("Ver Todos")
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: product.produtosComprados.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = product.produtosComprados[index];
                  return InkWell(
                    onTap: () {
                     Get.toNamed("/product",
                      arguments: {
                        "id" : item.id,
                        "avatar": item.img.toString(),
                        "nome": item.nome.toString(),
                        "preco": item.preco,
                        "desc": item.descricao.toString(),
                        "cate": item.categoria
                      }
                     );
                    },
                    child: CardproductComponent(
                        img: IMG_URL + item.img.toString(),
                        nome: item.nome.toString(),
                        desc: item.descricao.toString(),
                        preco: item.preco.toString(),
                      ),
                  );
              },),
            )
          ],
        ),
      );
  }

  _errorPage(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset("assets/img/aku.png"),
        ),
        Center(
          child: Text("Sem conexão com o servidor!",style: TextStyle(
            fontSize: 18
          ),)
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          product.listarProdutos();
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.red)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text("Tentar novamente",style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),),
        )
        ),
      ],)
    );
  }

  _loading(){
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }

  _cardLoading(){
   return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return  CardLoading(
          height: 200,
          margin: EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(10),
        );
      },
    );
  }
}