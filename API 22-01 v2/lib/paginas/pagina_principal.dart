import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proj/controles/controles_principal.dart';
import 'package:proj/modelos/modelo_principal.dart';
import 'package:proj/paginas/pagina_login.dart';
import 'package:proj/repositorio/repositorio_principal_implement.dart';
import 'package:proj/repositorio/repositorio_principal.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final PrincipalControle _controle =
      PrincipalControle(PrincipalRepositorioImplement());

  @override
  void initState() {
    super.initState();
    _controle.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalogo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _body(),
      floatingActionButton: _button(),
    );
  }

  _body() {
    return ValueListenableBuilder<List<PostProduto>>(
      valueListenable: _controle.posts,
      builder: (_, list, __) {
        return ListView.separated(
          itemCount: list.length,
          itemBuilder: (_, index) => ListTile(
            title: Text(list[index].name!),
            onTap: () => Navigator.pushNamed(context, '/detalheproduto',
                arguments: list[index]),
            trailing: Container(
              width: 100,
              child: Row(
                children: <Widget>[
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        AlertDialog(
                          title: const Text('Atenção!'),
                          content: SingleChildScrollView(
                              child: ListBody(children: const <Widget>[
                            Text('Are you sure want delete this item?'),
                          ])),
                        );

                        actions:
                        <Widget>[
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () {
                              //api. deleteProduct(widget.cases.id);
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName));
                            },
                          ),
                          FlatButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ];
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          ),
          separatorBuilder: (_, __) => const Divider(),
        );
      },
    );
  }

  _button() {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, '/criarproduto'),
      child: const Icon(Icons.add),
    );
  }
}
