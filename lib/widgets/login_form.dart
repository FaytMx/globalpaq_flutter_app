import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:globalpaq_app/api/authentication_api.dart';
import 'package:globalpaq_app/helpers/http_response.dart';
import 'package:globalpaq_app/pages/home_page.dart';
import 'package:globalpaq_app/utils/dialogs.dart';
import 'package:globalpaq_app/utils/responsive.dart';
import 'package:globalpaq_app/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = new GlobalKey();
  String _email = '', _password = '';
  Logger _logger = Logger();

  Future<void> _submit() async {
    final isOk = _formKey.currentState.validate();
    if (isOk) {
      ProgressDialog.show(context);
      final authenticationAPI = GetIt.instance<AuthenticationAPI>();
      final HttpResponse response = await authenticationAPI.login(
          correo: this._email, password: this._password);
      ProgressDialog.dismiss(context);

      if (response.data != null) {
        print(response.data.data);
        var res = response.data;
        if (res.err == false) {
          _logger.i("Existe Token");
          Get.off(() => HomePage());
        } else {
          _logger.e("Login fallo");
          Dialogs.alert(context,
              title: "Error", description: res.data["message"]);
        }
      } else {
        _logger.e("Login fail");
        Dialogs.alert(context,
            title: "Error", description: response.error.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(maxWidth: responsive.isTablet ? 430 : 340),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputText(
                label: "EMAIL",
                keyboardType: TextInputType.emailAddress,
                fontSize: responsive.dp(1.4),
                onChanged: (text) {
                  this._email = text;
                },
                validator: (text) {
                  if (!text.contains('@')) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                label: "PASSWORD",
                obscureText: true,
                fontSize: responsive.dp(1.4),
                onChanged: (text) {
                  this._password = text;
                },
                validator: (text) {
                  if (text.trim().length == 0) {
                    return 'Invalid password';
                  }

                  return null;
                },
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    color: Color(0xff07326b),
                    onPressed: this._submit,
                    child: Text(
                      'Sing in',
                      style: TextStyle(
                          color: Colors.white, fontSize: responsive.dp(1.5)),
                    )),
              ),
              SizedBox(height: responsive.dp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Algon texto random',
                    style: TextStyle(fontSize: responsive.dp(1.5)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Link',
                        style: TextStyle(
                            color: Color(0xff07326b),
                            fontSize: responsive.dp(1.5)),
                      ))
                ],
              ),
              SizedBox(
                height: responsive.dp(10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
