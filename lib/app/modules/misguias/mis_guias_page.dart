import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/misguias/mis_guias_controller.dart';

class MisGuiasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MisGuiasController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("MisGuias Page"),
        ),
      ),
    );
  }
}
