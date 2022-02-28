import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:proj/modelos/modelo_principal.dart';
import 'package:proj/repositorio/repositorio_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';

const url = 'http://153.92.214.229:27019';
Dio _dio = Dio();
class PrincipalRepositorioImplement implements RepositorioPrincipal{
  @override

  
  Future<List<PostProduto>> getList() async {

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");
            
    try{
      var response = await _dio.get(url+'/products', options: Options(headers: {'Authorization': 'Bearer $token'}));
      return (response.data  as List).map((e) =>
        PostProduto.fromJson(e)).toList();
    }catch(erro){
      print(erro);
    }
    return [];
  }

  Future<PostProduto?> createProduct({required PostProduto produto}) async {
    Map data = {
      'name': produto.name,
      'price': produto.price,
      'file': produto.path,
      'Offer': produto.Offer,
      'categoryId': produto.categoryId,
    };
    print('---------------------------');
    print(data);
    print('---------------------------');
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString("tokenjwt") ?? "");
    print(token);
    try{
       final Response response = await _dio.post(url+'/products', data: jsonEncode(data), options: Options(headers: {'Authorization': 'Bearer $token'}));

    print('---------------------------');
    print(response);
    print('---------------------------');
      

       return PostProduto.fromJson(json.decode(response.data));
    }catch(erro){
      print(erro);
    }
    /* final Response response = await Dio().post(url+'/products', data: jsonEncode(data), options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.statusCode == 200) {
      return PostProduto.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to post cases');
    } */
    return null;
  }

  Future<void> deleteUser({required String id}) async {
    try {
      await _dio.delete('/products/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
  
}
