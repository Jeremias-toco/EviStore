import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class CardproductComponent extends StatelessWidget {
  final String nome;
  final String preco;
  final String desc;
  final String img;
  CardproductComponent({
    required this.nome,
    required this.desc,
    required this.img,
    required this.preco,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(3,3)
          )
        ]
      ),
      margin: EdgeInsets.all(10),
      child: FillImageCard(
        imageProvider: NetworkImage(img,scale: 1),
        title: Text(nome,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
        description: Text(desc,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        height: 200,
        heightImage: 140,
        contentPadding: EdgeInsets.all(10),
        width: double.infinity,
        footer: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(preco+" Kz",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              Icon(Icons.favorite,color: Colors.red,)
            ],
          ),
        ),
      ),
    );
  }
}