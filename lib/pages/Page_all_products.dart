import 'package:evistore/Components/Not_connection.dart';
import 'package:evistore/Components/header.dart';
import 'package:evistore/Components/list_products.dart';
import 'package:evistore/Components/loading.dart';
import 'package:evistore/Components/searchBar_component.dart';
import 'package:evistore/Controllers/Product_controller.dart';
import 'package:evistore/Models/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageAllProducts extends StatefulWidget {
 
  @override
  State<PageAllProducts> createState() => _PageAllProductsState();
}

class _PageAllProductsState extends State<PageAllProducts> {
  ProductController produtos = Get.put(ProductController());
  final controller = TextEditingController();
  @override
  void initState() {
    produtos.listarTodosProdutos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos produtos",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          SearchbarComponent(
            onPress: () {
              produtos.pesquisa.clear();
              produtos.pesquisarProdutos(controller.text);
            },
            controller: controller,
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Obx(() {
              if (produtos.loading.value) {
                return Loading();
              } else if(produtos.todosProdutos.isEmpty && produtos.pesquisa.isEmpty){
                return NotConnection(pressed: 
                  () {
                    produtos.listarTodosProdutos();
                  },
                );
              }else if(produtos.pesquisa.isNotEmpty){
                return ListProducts(produtos: produtos.pesquisa);
              }else{
                return ListProducts(
                  produtos: produtos.todosProdutos,);
              }
            },)
          )
        ],
      ),
    );
  }
}