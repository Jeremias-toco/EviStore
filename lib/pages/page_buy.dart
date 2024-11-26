import 'package:flutter/material.dart';

class PageBuy extends StatelessWidget {
  const PageBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da compra"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/img/a0a.png"),
              SizedBox(height: 40,),
             
              Text("Compra realizada com sucesso!",style: TextStyle(
                fontSize: 20,
              ),),
             
              SizedBox(height: 20,),
             ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)
              ), 
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.download,color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                    Text("Exportar a factura",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  ],
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