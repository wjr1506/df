import 'package:flutter/material.dart';
import 'package:proj/paginas/pagina_Principal.dart';
import 'package:proj/paginas/pagina_login.dart';
import 'package:proj/paginas/sub_pagina_interacoes/sub_criar_produto.dart';
import 'package:proj/paginas/sub_pagina_interacoes/sub_pagina.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes:{
        '/login': (_) => PaginaLogin(),
        '/principal': (_) => const PaginaPrincipal(),
        '/detalheproduto': (_) => const DetalheProduto(),
        '/criarproduto': (_) => const CreateUser(),

      }
      
    );
  }
}
