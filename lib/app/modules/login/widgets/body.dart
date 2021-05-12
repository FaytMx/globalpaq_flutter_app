import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/login/login_controller.dart';
import 'package:globalpaq_app/app/modules/login/widgets/background.dart';
import 'package:globalpaq_app/app/modules/login/widgets/rounded_input_field.dart';
import 'package:globalpaq_app/app/modules/login/widgets/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/PASOS.svg",
              height: Get.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Tu Correo",
              onChanged:  _.onCorreoChanged,
            ),
            RoundedPasswordField(
              onChnaged: _.onPasswordChanged,
            ),
            Container(
              width: Get.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: Colors.orange,
                    onPressed: _.submit,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
