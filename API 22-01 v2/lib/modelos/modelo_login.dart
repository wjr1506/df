class PostLogin{
  final String? id;
  final String? email;
  final String? name;
  final bool? admin;
  final String? token;


  PostLogin({this.id,this.email, this.name, this.admin, this.token});

  factory PostLogin.deJson(Map<String, dynamic> json){
    return PostLogin(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      admin: json['admin'],
      token: json['token'],
    );
  }

  Map<String, dynamic> paraJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'admin': admin,
      'token': token,
    };
  }

@override
  String toString() {

    return 'Usuário(token $token)';
  }

}