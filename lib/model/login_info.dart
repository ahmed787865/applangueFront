class LoginInfo {
  String? token;
  String? username;
  String? whatsapp;
  String? usertype;

  LoginInfo.fromJson(Map<String, dynamic> json) {
    token = json['token'].toString();
    username = json['user_name'].toString();
    whatsapp = json['whatsapp'].toString();
    usertype = json['user_type'].toString();
  }
}