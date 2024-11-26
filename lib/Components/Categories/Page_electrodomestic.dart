import 'package:evistore/Components/Not_connection.dart';
import 'package:evistore/Components/list_products.dart';
import 'package:evistore/Components/loading.dart';
import 'package:evistore/Controllers/Product_controller.dart';
import 'package:evistore/Models/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageElectrodomestic extends StatefulWidget {
  const PageElectrodomestic({super.key});

  @override
  State<PageElectrodomestic> createState() => _PageElectrodomesticState();
}

class _PageElectrodomesticState extends State<PageElectrodomestic> {
  @override
  final ProductController _controller = Get.put(ProductController());
  String categoria = "Electrodoméstico";
  
  List<Product> lista = [];

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
        } else if(lista.isNotEmpty) {
          return ListProducts(produtos:lista);
        }else{
          return NotConnection(pressed: () {
            _controller.listarCategorias(categoria);
          },);
        }
      },),
    );
  }
}