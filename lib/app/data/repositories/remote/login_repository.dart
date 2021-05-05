import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/login_response.dart';
import 'package:globalpaq_app/app/data/providers/remote/login_api.dart';

class LoginRepository {
  final LoginAPI _api = Get.find<LoginAPI>();

  Future<LoginResponse> login({@required correo, @required password}) =>
      _api.login(correo: correo, password: password);
}
