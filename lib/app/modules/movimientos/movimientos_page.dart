import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/movimientos/movimientos_controller.dart';

class MovimientosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovimientosController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Movimientos Page"),
        ),
      ),
    );
  }
}
