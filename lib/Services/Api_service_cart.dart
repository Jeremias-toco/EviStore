import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:evistore/Http/Http_Request.dart';
import 'package:evistore/Models/Cart_model.dart';

class ApiServiceCart{
  final dio =  Dio();
  String BASE_URL = HttpRequest.BASE_URL;

  Future<Response> addToCart(CartModel carts)async{
    var res = await dio.post(BASE_URL + "add/carrinho",
      data: jsonEncode(carts) 
    );
    return res;
  }

  Future<Response> listCart(int id)async{
    var res = await dio.get(BASE_URL + "carrinho",queryParameters: {"id":id});
    return res;
  } 

  Future<Response> deleteCart(int id)async{
    var res = await dio.get(BASE_URL+"carrinho/delete",queryParameters: {"id":id});
    return res;
  }
}