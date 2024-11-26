import 'package:evistore/Components/list_products.dart';
import 'package:evistore/Components/loading.dart';
import 'package:evistore/Controllers/Product_controller.dart';
import 'package:evistore/Models/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PageModa extends StatefulWidget {
  const PageModa({super.key});

  @override
  State<PageModa> createState() => _PageModaState();
}

class _PageModaState extends State<PageModa> {
  final ProductController _controller = ProductController();

  List<Product> lista = [];

  String categoria = "Moda";
  
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