import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class PayGet extends StatelessWidget {
  const PayGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados do comprador"),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/img/admin.png"),
              SizedBox(height: 20,),
              Text("Cristiano Anjos",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Divider(),
              Text("Cristiano@gmail.com",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Divider(),
              Text("Valor á pagar: 3.000,00 Kz",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.4),
                        blurRadius: 22,
                        offset: Offset(5, 5)
                      )
                    ]
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Endereço da entrega",
                    ),
                  ),
                ),
            ),
            SizedBox(height: 20,),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.4),
                        blurRadius: 22,
                        offset: Offset(5, 5)
                      )
                    ]
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "descrição da entrega",
                    ),
                  ),
                ),
            ),
            SizedBox(height: 20,),
             ElevatedButton(
              onPressed: (){
                Get.toNamed("/pay3");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)
              ), 
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Avançar",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              )
            ),
            ],
          ),
        ),
      ),
    );
  }
}