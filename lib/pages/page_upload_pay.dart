import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageUploadPay extends StatelessWidget {
  const PageUploadPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento por referência"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/img/admin.png"),
              SizedBox(height: 40,),
              Row(
                children: [
                  Icon(Icons.file_copy),
                  SizedBox(width: 20,),
                  Text("Comprovativo do pagamento",style: TextStyle(
                    fontSize: 20,
                  ),),
                ],
              ),
              SizedBox(height: 5,),
              Divider(),
              SizedBox(height: 40,),
             ElevatedButton(
              onPressed: (){
                Get.toNamed("/buy");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)
              ), 
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload,color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                    Text("Enviar comprovativo",
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