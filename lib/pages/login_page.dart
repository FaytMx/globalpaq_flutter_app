import 'package:flutter/material.dart';
import 'package:globalpaq_app/utils/responsive.dart';
import 'package:globalpaq_app/widgets/circle.dart';
import 'package:globalpaq_app/widgets/icon_container.dart';
import 'package:globalpaq_app/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(60);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: -(pinkSize) * 0.3,
                    right: -(pinkSize) * 0.3,
                    child: Circle(
                      size: pinkSize,
                      colors: [Color(0xff4984b4), Color(0xff07326b)],
                    )),
                Positioned(
                    top: -(orangeSize) * 0.4,
                    left: -(orangeSize) * 0.2,
                    child: Circle(
                      size: orangeSize,
                      colors: [Colors.orange, Colors.deepOrangeAccent],
                    )),
                Positioned(
                    top: pinkSize * 0.35,
                    child: Column(
                      children: [
                        IconContainer(
                          size: responsive.wp(30),
                        ),
                        SizedBox(
                          height: responsive.dp(3),
                        ),
                        Text(
                          'GlobalPaq \n App',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: responsive.dp(2)),
                        )
                      ],
                    )),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
