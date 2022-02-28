class User{
  final String? id;
  final String? email;
  final String? name;
  final bool? admin;
  final String? token;


  User({this.id,this.email, this.name, this.admin, this.token});

  factory User.deJson(Map<String, dynamic> json){
    return User(
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