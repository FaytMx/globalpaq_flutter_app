import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/envios/envios_controller.dart';

class EnviosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnviosController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Envios Page"),
        ),
      ),
    );
  }
}
