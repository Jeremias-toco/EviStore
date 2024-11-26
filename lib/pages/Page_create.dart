import 'package:email_validator/email_validator.dart';
import 'package:evistore/Controllers/Users_controller.dart';
import 'package:evistore/pages/Page_login.dart';
import 'package:evistore/pages/page_confirm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageCreate extends StatelessWidget {
  PageCreate({super.key});

  final _form = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  final users = UsersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _form,
        child: ListView(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset("assets/img/evistore.png"),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text("Criar Conta",style: TextStyle(
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
                  child: TextFormField(
                    controller: _nome,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Preencha o campo nome";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Insere o Nome",
                      prefixIcon: Icon(Icons.person)
                    ),
                  ),
                ),
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
                  child: TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Preeencha o campo e-mail";
                      }else if(!EmailValidator.validate(value)){
                        return "E-mail inválido";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Insere o E-mail",
                      prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
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
                  child: TextFormField(
                    obscureText: true,
                    controller: _senha,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Preencha o campo senha";
                      }else if (value.length < 6){
                        return "A tua senha precisa ter no mínimo 6 caracteres";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Insere a senha",
                      prefixIcon: Icon(Icons.lock)
                    ),
                  ),
                ),
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
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Preencha o campo senha";
                      }else if (value.length < 6){
                        return "A tua senha precisa ter no mínimo 6 caracteres";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confirme a senha",
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
                onPressed: (){
                   if (_form.currentState!.validate()) {
                      users.criarConta(_nome.text, _email.text, _senha.text);
                   }
                }, 
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Obx(() {
                    if (users.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Text("Criar",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),);
                    }
                  },)
                )),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: () {
                Get.offNamed("/");
              },
              child: Center(
                child: Text("Login",style: TextStyle(
                  fontSize: 18,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}