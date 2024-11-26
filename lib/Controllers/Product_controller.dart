import 'package:evistore/Models/Product_model.dart';
import 'package:evistore/Services/Api_Service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final apiService = ApiService();
  List<Product> produtos = <Product>[].obs;
  List<Product> produtosPopulares = <Product>[].obs;
  List<Product> produtosComprados = <Product>[].obs;
  List<Product> todosProdutos = <Product>[].obs;
  List<Product> pesquisa = <Product>[].obs;
  List<Product> categorias = <Product>[].obs;
  List<Product> computadores = <Product>[].obs;
  RxBool loading = false.obs;
  RxString messageError = "".obs;

  void listarProdutos()async{
    loading.value = true;
    try {
      var list = await apiService.ListarProdutos();
      var list_2 = await apiService.listarProdutosPopulares();
      var list_3 = await apiService.listarProdutosComprados();
      produtos.assignAll(list);
      produtosPopulares.addAll(list_2);
      produtosComprados.addAll(list_3);
      loading.value = false;
    } catch (e) {
      messageError(e.toString());
      loading.value = false;
    }
  }

  listarTodosProdutos()async{
    loading(true);
    try {
      var request = await apiService.listarTodosProdutos();
      loading(false);
      todosProdutos.addAll(request);
    } catch (e) {
      loading(false);
    }
  }

  pesquisarProdutos(String search)async{
    loading(true);
    try {
      var list = await apiService.pesquisarProdutos(search);
      loading(false);
      pesquisa.addAll(list);
    } catch (e) {
      loading(false);
    }
  }

  Future<List<Product>> listarCategorias(String categoria)async{
    loading(true);
    List<Product> res = [];
    try {
      res = await apiService.buscarCategoria(categoria);
      loading(false);
      categorias.addAll(res);
    } catch (e) {
      loading(false);
    }
    return res;
  }

  listarCategoriasComputador(String categoria)async{
    loading(true);
    try {
      var res = await apiService.buscarCategoria(categoria);
      loading(false);
    } catch (e) {
      loading(false);
    }
  }

}