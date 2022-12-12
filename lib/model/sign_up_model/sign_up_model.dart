class SignupModel {
  final String email;
  final String password;
  final String username;
  final String phone;


  SignupModel({
    required this.email,
    required this.password,
    required this.username,
    required this.phone,

  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      email: json["email"] ?? '',
      password: json["password"] ?? '',
      username: json["username"] ?? '',
      phone: json["phone"] ?? '',

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "username": username,
      "phone": phone,

    };
  }
}
