class LoginResponse {
  LoginResponse({
    this.err,
    this.status,
    this.data,
  });

  final bool err;
  final int status;
  final Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        err: json["err"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "err": err,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({this.token, this.message});

  final String token;
  final String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] ?? null,
        message: json["message"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
