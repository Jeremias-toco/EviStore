import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {

  final String nome;
  const HeaderComponent({super.key,required this.nome});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Olá, $nome",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
              )),
            Text("Seja bem-vindo")
          ],
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            maxRadius: 25,
            backgroundImage: AssetImage("assets/img/usuario.png"),
            )
        ],
      ),
    );
  }
}