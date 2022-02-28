import 'package:flutter/material.dart';
import 'package:proj/modelos/modelo_principal.dart';

class DetalheProduto extends StatelessWidget {
  const DetalheProduto({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)!.settings.arguments as PostProduto ;
    return Scaffold(
      appBar: AppBar(title: Text(argumento.name!),
      ),

      body: Container(padding: const EdgeInsets.all(28),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            argumento.name!,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              argumento.id.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "número: "+argumento.id.toString() + ", autor: "+ argumento.url.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
            onPressed: (){
            },
          child: const Text('salvar')
            )],
        ),
      ) 
    );
  }
}