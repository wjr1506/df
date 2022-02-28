

import 'package:flutter/material.dart';

alert(BuildContext context, String msg){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: const Text("Atenção"),
        content: Text(msg),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("OK"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
}