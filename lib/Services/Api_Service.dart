import 'package:dio/dio.dart';
import 'package:evistore/Http/Http_Request.dart';
import 'package:evistore/Models/Product_model.dart';

class ApiService{
  String BASE_URL = HttpRequest.BASE_URL;
  final dio = Dio();
  List<Product> lista = [];
  List<Product>produtosPopulares = [];
  List<Product>produtosComprados = [];
  List<Product>todosProdutos = [];
  List<Product>resultadoDaPesquisa = [];

  Future<List<Product>> ListarProdutos()async{

    var res = await dio.get(BASE_URL +"produtos/recentes");

    if(res.statusCode == 200){
      var list = res.data as List;
      lista = list.map((json)=> Product.fromJson(json)).toList();
    }

    return lista;
  }

  Future<List<Product>> listarProdutosPopulares()async{
    var response = await dio.get(BASE_URL+"produtos/populares");
    List list = response.data;
    produtosPopulares = list.map((json) => Product.fromJson(json)).toList();

    return produtosPopulares;
  }

  Future<List<Product>> listarProdutosComprados()async{
    var response = await dio.get(BASE_URL + "produtos/comprados");
    if (response.statusCode == 200) {
      List list = response.data;
      produtosComprados = list.map((json) => Product.fromJson(json)).toList();
    }
    return produtosComprados;
  }

  Future<List<Product>> listarTodosProdutos()async{
    var response = await dio.get(BASE_URL+"produtos");
    if (response.statusCode == 200) {
      List list = response.data;
      todosProdutos = list.map((e) => Product.fromJson(e)).toList();
    }
    return todosProdutos;
  }

  Future<List<Product>> pesquisarProdutos(String search)async{
    var response = await  dio.get(BASE_URL+"produtos/pesquisar",
      queryParameters: {
        "search":search
      }
    );
    if (response.statusCode == 200) {
      List data = response.data;
      resultadoDaPesquisa = data.map((e) => Product.fromJson(e)).toList();
    }
    return resultadoDaPesquisa;
  }

  Future<List<Product>> buscarCategoria(String categoria)async{
    var res = await dio.get(BASE_URL+"produtos/categoria",data: {"cate":categoria});
    List<Product> categorias = [];
    if(res.statusCode == 200){
      var list = res.data as List;
      categorias = list.map((e) => Product.fromJson(e)).toList();
    }
    return categorias;
  }
}