import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/login_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/login_repository.dart';
import 'package:globalpaq_app/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository = Get.find<LoginRepository>();

  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  String _correo = '', _password = '';

  void onCorreoChanged(String text) {
    print("🚲 $text");
    _correo = text;
  }

  void onPasswordChanged(String text) {
    print("🎍 $text");

    _password = text;
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> submit() async {
    try {
      LoginResponse response =
          await _loginRepository.login(correo: _correo, password: _password);

      if (response.err == true) {
        Get.dialog(AlertDialog(
          title: Text("Error"),
          content: Text(response.data.message),
          actions: [
            MaterialButton(
                child: Text('OK'),
                onPressed: () {
                  Get.back();
                })
          ],
        ));

        return;
      }

      await _localAuthRepository.setSession(response.data.token);
      Get.offAllNamed(AppRoutes.HOME);
      print("login ok $response");
    } catch (e) {
      String message = "";
      if (e is DioError) {
        if (e.response != null) {
          message = e.response.statusMessage;
        } else {
          message = e.message;
        }
      }

      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          MaterialButton(
              child: Text('OK'),
              onPressed: () {
                Get.back();
              })
        ],
      ));
    }
  }
}
