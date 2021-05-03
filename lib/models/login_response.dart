// import 'dart:convert';

class LoginResponse {
  final bool err;
  final int status;
  final Map<String, dynamic> data;

  LoginResponse({this.err, this.status, this.data});

  static LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        err: json['err'], status: json['status'], data: json['data']);
  }
}
