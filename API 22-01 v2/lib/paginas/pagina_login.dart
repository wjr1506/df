import 'package:flutter/material.dart';
import 'package:proj/controles/controles_login.dart';
import 'package:proj/widgets/alert.dart';

class PaginaLogin extends StatefulWidget {
  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final ControleLogin _controle = ControleLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF373737),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.black),

              filled: true,
              fillColor: Colors.white,

              //box Desativada
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF373737),
                ),
              ),

              //box Ativada
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xFF373737),
              )),
            ),
            onChanged: _controle.setLogin,
          ),

          const SizedBox(height: 10),
          TextField(
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                color: Colors.black,
              ),

              filled: true,
              fillColor: Colors.white,
              //box Desativada
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF373737)),
              ),
              //box Ativada
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF373737),
                ),
              ),
            ),
            obscureText: true,
            onChanged: _controle.setSenha,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xFFf3c43d)),
              onPressed: () {
                _controle.autorizado().then((resultado) {
                  if (resultado != null) {
                    Navigator.of(context).pushReplacementNamed('/principal');
                  } else {

                    print("resultado: $resultado");
                    alert(context, 'Login inválido');
                  }
                });
              },
              child: const Text('Login'))
        ],
      ),
    );
  }
}