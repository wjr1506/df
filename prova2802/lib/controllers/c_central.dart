import 'package:flutter/material.dart';

import '../models/m_user.dart';
import '../repository/r_central.dart';

class CentralControle{

  final RepositoryCentral _centralRepository;
  CentralControle(this._centralRepository);

  ValueNotifier<List<PostProduto>> posts = ValueNotifier<List<PostProduto>>([]);

  fetch()async{
    posts.value = await _centralRepository.getList();
  }

}