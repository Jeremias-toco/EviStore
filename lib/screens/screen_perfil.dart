import 'package:evistore/Components/Modal_about.dart';
import 'package:evistore/Controllers/Users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPerfil extends StatefulWidget {
  ScreenPerfil({super.key});

  @override
  State<ScreenPerfil> createState() => _ScreenPerfilState();
}

class _ScreenPerfilState extends State<ScreenPerfil> {
  final UsersController user = Get.put(UsersController());

  @override
  void initState() {
    user.pegarDadosUsuario();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Colors.redAccent.withOpacity(0.4),
                        offset: Offset(3, 3),
                      )
                    ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.redAccent.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                       maxRadius: 47,
                       backgroundImage: AssetImage("assets/img/usuario.png"),
                    ),
                  ),
                ),
              )
            ]
          ),
          SizedBox(height: 20,),
          Container(
            child: Column(
              children: [
                Text(user.nome.value,
                textAlign: TextAlign.center, 
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 5,),
                Text(user.email.value,
                textAlign: TextAlign.center, 
                style: TextStyle(
                  fontSize: 13,
                ),),
                SizedBox(height: 20,),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                  child: ListTile(
                    onTap: () {
                      Get.snackbar("Mensagem", "Indisponível de momento.");
                    },
                    leading: Icon(Icons.person,color: Colors.red,),
                    title:Text("Editar Perfil"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                  child: ListTile(
                    onTap: () {
                      _showModal();
                    },
                    leading: Icon(Icons.info_outline,color: Colors.red,),
                    title:Text("Sobre o App"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                  child: ListTile(
                    onTap: () {
                      Get.snackbar("Mensagem", "Indisponível de momento.");
                    },
                    leading: Icon(Icons.security,color: Colors.red,),
                    title:Text("Politicas de privacidade e termos de uso"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                  child: InkWell(
                    onTap: () {
                      user.removerUsuarioLocal();
                      Get.offNamed("/");
                    },
                    child: ListTile(
                      leading: Icon(Icons.logout,color: Colors.red,),
                      title:Text("Terminar sessão"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showModal(){
    String txt = "EviStore é uma plataforma de comércio eletrônico que facilita "+
    "a compra e venda de produtos e serviços entre consumidores e empresas online.";
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
          icon: Image.asset("assets/img/evistore.png"),
          title: Text("Sobre o EviStore"),
          scrollable: true,
          content: Column(
            children: [
              Text("Versão 1.0.0",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20),
              Text(txt,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("Desenvolvido por Jeremias Toco(Programador) e Cristiano Anjos(Analista de Sistemas)",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center),
            ],
          ),
        );
      },
    );
  }
}