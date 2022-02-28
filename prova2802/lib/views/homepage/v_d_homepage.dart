import 'package:flutter/material.dart';
import 'package:prova2802/models/m_login.dart';
import 'package:prova2802/widgets/w_alert_erro.dart';
import 'package:prova2802/widgets/w_alert_interation.dart';

import '../../controllers/c_central.dart';
import '../../models/m_user.dart';
import '../../repository/r_central_implement.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CentralControle _controle =
      CentralControle(CebtralRepositoryImplement());

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
    final profile = PostProduto().url == null || PostProduto().url!.isEmpty ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(PostProduto().url!),);
    return ValueListenableBuilder<List<PostProduto>>(
      
      valueListenable: _controle.posts,
      builder: (_, list, __) {
        return ListView.separated(
          itemCount: list.length,
          itemBuilder: (_, index) => ListTile(
            leading: profile,
            title: Text(list[index].name!),
            onTap: () => Navigator.pushNamed(context, '/detalheproduto',
                arguments: list[index]),
            trailing: Container(
              width: 100,
              child: Row(
                children: <Widget>[
                  IconButton(onPressed: () {
                        print('CLICOUUUUUU');
                        print(list[index].id!);
                        
                        alertinteration(context, 'Deseja editar esse usuário?');

                  }, icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        print('CLICOUUUUUU');
                        alertinteration(context, 'Deseja deletar esse usuário?');
                        AlertDialog(
                          title: const Text('Atenção!'),
                          content: SingleChildScrollView(
                              child: ListBody(children: const <Widget>[
                            Text('Deseja deletar esse item?'),
                          ])),
                        );

                        actions:
                        <Widget>[
                          ElevatedButton(
                            child: Text('Yes'),
                            onPressed: () {
                              //api. deleteProduct(widget.cases.id);
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName));
                            },
                          ),
                          ElevatedButton(
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