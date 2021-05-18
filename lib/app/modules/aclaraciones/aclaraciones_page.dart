import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/aclaraciones/aclaraciones_controller.dart';

class AclaracionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AclaracionesController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Aclaraciones Page"),
        ),
      ),
    );
  }
}
