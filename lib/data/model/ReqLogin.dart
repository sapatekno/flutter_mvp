import 'dart:convert';

ReqLogin reqLoginFromJson(String str) => ReqLogin.fromJson(json.decode(str));

String reqLoginToJson(ReqLogin data) => json.encode(data.toJson());

class ReqLogin {
  ReqLogin({
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  factory ReqLogin.fromJson(Map<String, dynamic> json) => ReqLogin(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
