import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/ver_pedidos/ver_pedidos_controller.dart';

class VerPedidosPage extends StatelessWidget {
  const VerPedidosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerPedidosController>(
      builder: (_) => Scaffold(
        body: Container(
          child: Center(
            child: Text("Ver pedidos"),
          ),
        ),
      ),
    );
  }
}
