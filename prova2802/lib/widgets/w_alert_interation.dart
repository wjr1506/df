import 'package:flutter/material.dart';

alertinteration(BuildContext context, String msg){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: const Text("Atenção"),
        content: Text(msg),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Não"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            child: const Text("sim"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
}