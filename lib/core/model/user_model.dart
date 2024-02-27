
class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password
  });

  String? id;
  String? name;
  String? email;
  String? password;


  UserModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['date'];

  }

  Map<String, dynamic> toJson()
  {
    return
      {
        'id' : id,
        'name' : name,
        'email' : email,
        'password' : password
      };
  }
}
