import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {

  FirebaseAuth auth = FirebaseAuth.instance;

  String email = "wellinton@gmail.com";
  String senha = "123456";
  FirebaseUser usuarioAtual = await auth.currentUser();
  if( usuarioAtual != null ){//logado
    print("Usuario atual logado email: " + usuarioAtual.email );
  }else{//deslogado
    print("Usuario atual está DESLOGADO!!");
  }

  runApp(App());

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}