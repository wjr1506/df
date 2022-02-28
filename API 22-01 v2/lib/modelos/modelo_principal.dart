import 'dart:convert';

class PostProduto{
  final String? url;
  final int? id;
  final String? name;
  final int? price;
  final String? path;
  final String? file;
  final bool? Offer;
  final int? categoryId;

  PostProduto({this.url, this.id, this.name, this.price ,this.path, this.file, this.Offer, this.categoryId});

  factory PostProduto.fromJson(Map<String, dynamic> json){
    return PostProduto(
      url: json['url'],
      id: json['id'],
      name: json['name'],
      price: json['price'],
      path: json['path'],
      file: json['file'],
      Offer: json['Offer'],
      categoryId: json['categoryId']
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'url': url,
      'id': id,
      'name': name,
      'price': price,
      'path': path,
      'file': file,
      'Offer': Offer,
      'categoryId': categoryId
    };
  }


  @override
  String toString(){
    return json.encode(toJson());
  }
}
