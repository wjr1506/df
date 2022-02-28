import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:proj/modelos/modelo_login.dart';

class ControleLogin {

  final dio = Dio();
  var url = 'http://153.92.214.229:27019';
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String loginValor) => _login = loginValor;

  String? _senha;
  setSenha(String senhaValor) => _senha = senhaValor;

  Future<PostLogin?> autorizado() async {
    PostLogin? usuario;
    var header = {"Content-Type": "application/json"};
    try{
    Map<String, dynamic> params = {"email": _login, "password": _senha};
    Response response = await dio.post(url+"/sessions", data: params, options: Options(headers: header));
    usuario = PostLogin.deJson(response.data);
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("tokenjwt", response.data['token']);
    
    }on DioError catch(e){
        print('Error sending request!');
        print(e.message);
      
    }
    return usuario;
  }
}


