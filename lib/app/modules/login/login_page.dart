import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) => Scaffold(
              body: Center(
                child: Text("Login"),
              ),
            ));
  }
}
