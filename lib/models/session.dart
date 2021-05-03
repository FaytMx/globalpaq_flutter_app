import 'package:meta/meta.dart' show required;

class Session {
  final String token;
  final DateTime createdAt;

  Session({@required this.token, @required this.createdAt});

  static Session fromJson(Map<String, dynamic> json) {
    return Session(
        token: json['token'], createdAt: DateTime.parse(json["createdAt"]));
  }

  Map<String, dynamic> toJson() {
    return {"token": this.token, "createdAt": this.createdAt.toString()};
  }
}
