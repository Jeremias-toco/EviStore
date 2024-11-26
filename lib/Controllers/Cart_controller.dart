import 'package:evistore/Models/Cart_model.dart';
import 'package:evistore/Services/Api_service_cart.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController{
  RxInt contador = 1.obs;
  RxBool loading = false.obs;
  RxString err = "".obs;
  final serviceCart = ApiServiceCart();
  List<CartModel> listaCarrinho = [];
  RxInt totalCarrinho = 0.obs; 

  increment(){
    contador++;
  }

  decrement(){
    if(contador > 1){
      contador--;
    }else{
      contador.value = 1;
    }
  }

  adicionarCarrinho(CartModel carts)async{
    loading(true);
    try {
      var req = await serviceCart.addToCart(carts);
      loading(false);
      if (req.statusCode == 200) {
        var data = req.data;
        if (data["status"] == true) {
          Get.snackbar("Mensagem", data["msg"]);
        }else{
          Get.snackbar("Mensagem", data["msg"]);
        }
      }else{
        Get.snackbar("Erro", "Houve um erro ao tentar adicionar produto ao carrinho");
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Erro", "Falha na conexão com servidor");
    }
  }

  listarCarrinho(int id)async{
    loading(true);
    try {
      var res = await serviceCart.listCart(id);
      loading(false);
      if (res.statusCode == 200) {
        var data = res.data;
        totalCarrinho(data["total"]);
        List list = data["carrinho"];
        listaCarrinho = list.map((e) => CartModel.fromJson(e)).toList();
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Erro", "$e");
    }
  }

  apagarCarrinho(int id)async{
    loading(true);
    try {
      var res = await serviceCart.deleteCart(id);
       loading(false);
      if(res.statusCode == 200){
        var data = res.data;
        Get.snackbar("Mensagem", data["msg"]);
      }
    } catch (e) {
      loading(false);
    }
  }
}