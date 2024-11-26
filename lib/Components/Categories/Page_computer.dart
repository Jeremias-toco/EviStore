import 'package:evistore/Components/list_products.dart';
import 'package:evistore/Components/loading.dart';
import 'package:evistore/Controllers/Product_controller.dart';
import 'package:evistore/Models/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageComputer extends StatefulWidget {
  const PageComputer({super.key});

  @override
  State<PageComputer> createState() => _PageComputerState();
}

class _PageComputerState extends State<PageComputer> {
  @override
  final ProductController _controller = ProductController();

  List<Product> lista = [];

  String categoria = "Computador";
  
  _listagem()async{
    lista = await _controller.listarCategorias(categoria);
  }

  void initState(){
    _listagem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (_controller.loading.value) {
          return Loading();
        } else if(lista.isNotEmpty){
          return ListProducts(produtos: lista);
        }else{
          return Container();
        }
      },),
    );
  }
}