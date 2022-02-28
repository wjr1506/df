import 'package:flutter/cupertino.dart';
import 'package:proj/modelos/modelo_principal.dart';
import 'package:proj/repositorio/repositorio_principal.dart';

class PrincipalControle{

  final RepositorioPrincipal _principalRepositorio;
  PrincipalControle(this._principalRepositorio);

  ValueNotifier<List<PostProduto>> posts = ValueNotifier<List<PostProduto>>([]);

  fetch()async{
    posts.value = await _principalRepositorio.getList();
  }

}