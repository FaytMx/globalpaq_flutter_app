import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/recolecciones/recolecciones_controller.dart';

class RecoleccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecoleccionesController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Recolecciones Page"),
        ),
      ),
    );
  }
}
