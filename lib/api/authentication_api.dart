import 'package:globalpaq_app/helpers/http.dart';
import 'package:globalpaq_app/helpers/http_response.dart';
import 'package:globalpaq_app/models/login_response.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Http _http;

  AuthenticationAPI(this._http);

  Future<HttpResponse<LoginResponse>> login(
      {@required String correo, @required String password}) {
    return _http.request<LoginResponse>('/asociado/login',
        method: "POST",
        data: {"correo": correo, "password": password}, parser: (data) {
      return LoginResponse.fromJson(data);
    });
  }
}
