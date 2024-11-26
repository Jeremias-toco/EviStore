import 'package:evistore/Components/CardProduct_component.dart';
import 'package:evistore/Controllers/Product_controller.dart';
import 'package:evistore/Http/Http_Request.dart';
import 'package:evistore/Models/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProducts extends StatelessWidget {
  
  final List<Product> produtos;

  ListProducts({required this.produtos});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: produtos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300
      ), 
      itemBuilder: (context, index) {
        var item = produtos[index];
        return InkWell(
          onTap: () {
            Get.toNamed("/product",
              arguments: {
                "id" : item.id,
                "nome": item.nome.toString(), 
                "desc": item.descricao.toString(), 
                "avatar": item.img.toString(), 
                "preco": item.preco,
                "desc":item.descricao,
                "cate": item.categoria
              }
            );
          },
          child: CardproductComponent(
            nome: item.nome.toString(), 
            desc: item.descricao.toString(), 
            img: HttpRequest.IMG_URL+item.img.toString(), 
            preco: item.preco.toString()
          ),
        );
      },
    );
  }
}