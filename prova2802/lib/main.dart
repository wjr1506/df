import 'package:flutter/material.dart';
import 'package:prova2802/views/create/v_create.dart';
import 'package:prova2802/views/details/v_details.dart';

import 'views/homepage/v_d_homepage.dart';
import 'views/v_login.dart';

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
        '/principal': (_) => const HomePage(),
        '/detalheproduto': (_) => const Details(),
        '/criarproduto': (_) => const Create(),

      }
      
    );
  }
}