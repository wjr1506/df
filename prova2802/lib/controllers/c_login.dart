import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/m_login.dart';

class ControleLogin {

  final dio = Dio();
  var url = 'http://153.92.214.229:27019';
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String loginValor) => _login = loginValor;

  String? _senha;
  setSenha(String senhaValor) => _senha = senhaValor;

  Future<User?> autorizado() async {
    User? usuario;
    var header = {"Content-Type": "application/json"};
    try{
    Map<String, dynamic> params = {"email": _login, "password": _senha};
    Response response = await dio.post(url+"/sessions", data: params, options: Options(headers: header));
    usuario = User.deJson(response.data);
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("tokenjwt", response.data['token']);
    
    }on DioError catch(e){
        print('Error sending request!');
        print(e.message);
      
    }
    return usuario;
  }
}