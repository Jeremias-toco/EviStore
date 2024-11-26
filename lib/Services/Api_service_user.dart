import 'package:dio/dio.dart';
import 'package:evistore/Http/Http_Request.dart';

class ApiServiceUser{
 String BASE_URL = HttpRequest.BASE_URL;
 final dio = Dio(); 

 Future<Response> login(String email,senha)async{
  var response = dio.post(BASE_URL + "login",
    queryParameters: {
      "email":email,
      "senha":senha,
    }
  );

  return response;
 }

 Future<Response> conta(String nome,email,senha)async{
  var response = dio.post(BASE_URL + "conta",
    queryParameters: {
      "nome":nome,
      "email":email,
      "senha":senha,
    }
  );
  return response;
 }
}