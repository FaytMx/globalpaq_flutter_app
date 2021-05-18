import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/pedidos/pedidos_controller.dart';

class PedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PedidosController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Pedidos Page"),
        ),
      ),
    );
  }
}
