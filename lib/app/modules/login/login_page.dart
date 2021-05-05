import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) => Scaffold(
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                          onChanged: _.onCorreoChanged,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: "Correo")),
                      TextField(
                        onChanged: _.onPasswordChanged,
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Password"),
                      ),
                      MaterialButton(
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.black,
                        onPressed: _.submit,
                      )
                    ],
                  ),
                ),
              )
            ));
  }
}
