import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class PageTypePay extends StatelessWidget {
  const PageTypePay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações da compra",
          
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/admin.png"),
            SizedBox(height: 20,),
            Text("Como pretendes comprar?",
            style: TextStyle(
            fontSize: 20
          ),),
            SizedBox(height: 20,),
             ElevatedButton(
              onPressed: (){
                Get.toNamed("/pay2");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)
              ), 
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Pagar antes da entrega",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              )
            ),
            SizedBox(height: 20,),
             ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)
              ), 
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Pagar após a entraga",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}