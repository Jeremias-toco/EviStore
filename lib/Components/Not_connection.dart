import 'package:flutter/material.dart';

class NotConnection extends StatelessWidget {
  final VoidCallback pressed;
  NotConnection({super.key,required this.pressed});

  @override
  Widget build(BuildContext context) {
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
          pressed;
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.red)
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
}