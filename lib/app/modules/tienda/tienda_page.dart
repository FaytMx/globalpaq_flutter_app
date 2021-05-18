import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/tienda/tienda_controller.dart';

class TiendaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TiendaController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Tienda Page"),
        ),
      ),
    );
  }
}
