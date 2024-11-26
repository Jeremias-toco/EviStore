import 'package:evistore/pages/Page_create.dart';
import 'package:flutter/material.dart';

class PageConfirm extends StatelessWidget {
  const PageConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Image.asset("assets/img/evistore.png"),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text("Confirmar conta",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
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
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Código de confirmação",
                    prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)
              ),
              onPressed: (){}, 
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Confirmar",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              )),
          ),
        ],
      ),
    );
  }
}