import 'package:flutter/material.dart';
import '../controllers/c_login.dart';
import '../widgets/w_alert_erro.dart';

class PaginaLogin extends StatefulWidget {
  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final ControleLogin _controle = ControleLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            decoration: const InputDecoration(
              labelText: "Email",
              filled: true,
              //box Desativada
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(

                ),
              ),

              //box Ativada
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(

              )),
            ),
            onChanged: _controle.setLogin,
          ),

          const SizedBox(height: 10),
          TextField(

            decoration: const InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(

              ),

              filled: true,
              fillColor: Colors.white,
              //box Desativada
              focusedBorder: OutlineInputBorder(

              ),
              //box Ativada
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                ),
              ),
            ),
            obscureText: true,
            onChanged: _controle.setSenha,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                _controle.autorizado().then((resultado) {
                  if (resultado != null) {
                    Navigator.of(context).pushReplacementNamed('/principal');
                  } else {
                    alerterror(context, 'Login inválido');
                  }
                });
              },
              child: const Text('Login'))
        ],
      ),
    );
  }
}