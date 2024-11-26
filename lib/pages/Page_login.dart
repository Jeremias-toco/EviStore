import 'package:email_validator/email_validator.dart';
import 'package:evistore/Controllers/Users_controller.dart';
import 'package:evistore/pages/Page_create.dart';
import 'package:evistore/pages/Page_home.dart';
import 'package:evistore/pages/Page_principal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageLogin extends StatefulWidget {
  PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final _form = GlobalKey<FormState>();

  final _email = TextEditingController();

  final _senha = TextEditingController();

  final Users = UsersController();

  @override
  void initState() {
    super.initState();
  }

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
              child: Text("Login",style: TextStyle(
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
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        //Get.snackbar("Error", "Preecha o campo e-mail");
                        return "Preecha o campo e-mail";
                      }else if(!EmailValidator.validate(value)){
                        Get.snackbar("Error", "E-mail inválido!");
                        return "E-mail inválido!";
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
                    controller: _senha,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        //Get.snackbar("Error", "Preencha o campo senha");
                        return "Preencha o campo senha";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Insere a senha",
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
                    Users.logar(_email.text, _senha.text);
                   }
                }, 
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Obx(() {
                    if (Users.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }else{
                      return Text("Entrar",style: TextStyle(
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
               Get.offNamed("/criar");
              },
              child: Center(
                child: Text("Criar conta",style: TextStyle(
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