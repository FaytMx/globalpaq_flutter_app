import 'package:globalpaq_app/app/data/models/responses/login_response.dart';
import 'package:meta/meta.dart' show required;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginAPI {
  final Dio _dio = Get.find<Dio>();

  Future<LoginResponse> login(
      {@required String correo, @required String password}) async {
    var response = await _dio.post('/asociado/login',
        options: Options(
            headers: {"Content-Type": "application/x-www-form-urlencoded"}),
        data: {"correo": correo, "password": password});

    return LoginResponse.fromJson(response.data);
  }
}
