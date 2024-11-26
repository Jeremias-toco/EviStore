import 'package:evistore/Services/Api_service_user.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersController {
  final _user = ApiServiceUser();
  RxBool isLoading = false.obs;
  var id = 0.obs;
  RxString nome = "".obs; 
  RxString email = "".obs;

  late SharedPreferences shps;

  logar(String email,senha)async{
    isLoading(true);
    try {
      var response = await _user.login(email, senha);
      isLoading(false);
      if (response.statusCode == 200) {
        var data = response.data;
        if (data["status"] == true) {
          Get.offNamed("/principal");
          _salvarUsuarioLocal(data["id"], data["nome"], data["email"]);
        } else {
          Get.snackbar("Mensagem", data["msg"]); 
        }
      } else {
        Get.snackbar("Erro", "Houve um erro ao tentar fazer login!");
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar("Erro", "Falha na conexão com servidor!");
    }
  }

  criarConta(String nome,email,senha)async{
    isLoading(true);

    try {
      var res = await _user.conta(nome, email, senha);
      isLoading(false);

      if(res.statusCode == 200){
        var data = res.data;
        if (data["status"] == true) {
          Get.snackbar("Mensagem", data["msg"]);
          _salvarUsuarioLocal(data["id"], data["nome"], data["email"]);
          Get.offNamed("/principal");
        } else {
          Get.snackbar("Mensagem", data["msg"]);
        }
      }else{
        Get.snackbar("Erro", "Houve uma falha ao tentar criar conta!");
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar("Erro", "Falha na conexão com servidor!");
    }
  }

  _salvarUsuarioLocal(int id,String nome,email)async{
    shps = await SharedPreferences.getInstance();
    shps.setInt("id", id);
    shps.setString("nome", nome);
    shps.setString("email", email);
  }

  pegarDadosUsuario()async{
    shps = await SharedPreferences.getInstance();
    id.value = shps.getInt("id")?? 0;
    nome.value = shps.getString("nome")?? "";
    email.value = shps.getString("email") ?? ""; 
  }

   removerUsuarioLocal()async{
    shps = await SharedPreferences.getInstance();
    shps.remove("id");
    shps.remove("nome");
    shps.remove("email");
  }

  verificarUsuarioLogado()async{
    shps = await SharedPreferences.getInstance();
    if (shps.getInt("id") != null) {
      Get.toNamed("/principal");
    }
  }                                     

}