import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/pedidos/pedidos_controller.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class PedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PedidosController>(
      builder: (_) => Scaffold(
          body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Text("Comprobante de pago"),
              if (_.listaPedidosPendientes.length > 0)
                _crearDropdown(
                  _.listaPedidosPendientes,
                  _.opcionSeleccionada,
                  (opt) => _.setOpcionSeleccionada(opt),
                ),
            ],
          ),
        ),
      )),
    );
  }
}

Widget _crearDropdown(List<DropdownMenuItem<String>> lista,
    String opcionSeleccionada, Function onChanged) {
  return Row(
    children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(
        width: 30,
      ),
      Expanded(
        child: DropdownButton(
          isExpanded: true,
          value: opcionSeleccionada,
          items: lista,
          onChanged: (opt) => onChanged(opt),
        ),
      ),
    ],
  );
}
