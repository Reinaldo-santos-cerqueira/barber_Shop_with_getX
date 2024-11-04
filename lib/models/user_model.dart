class UserModel {
  String name;
  String cpf;
  String password;
  String email;
  String photo;

  UserModel({
    required this.name,
    required this.cpf,
    required this.password,
    required this.email,
    required this.photo,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : name = json['name'] ?? "",
    cpf = json['cpf'] ?? "",
    password = json['password'] ?? "",
    email = json['email'] ?? "",
    photo = json['photo'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cpf'] = cpf;
    data['password'] = password;
    data['email'] = email;
    data['photo'] = photo;
    return data;
  }
}
