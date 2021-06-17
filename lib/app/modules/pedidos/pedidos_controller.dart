import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedidos_response.dart';
import 'package:globalpaq_app/app/data/repositories/remote/tienda_repository.dart';

class PedidosController extends GetxController {
  final TiendaRepository _tiendaRepository = Get.find<TiendaRepository>();

  //datos
  List<DropdownMenuItem<String>> _listaPedidosPendientes = [];
  List<DropdownMenuItem<String>> get listaPedidosPendientes =>
      _listaPedidosPendientes;

  String _opcionSeleccionada;
  String get opcionSeleccionada => _opcionSeleccionada;
  void setOpcionSeleccionada(String value) {
    this._opcionSeleccionada = value;
    update();
  }

  @override
  void onReady() {
    this.init();
    super.onReady();
  }

  Future<void> init() async {
    this._getOpcionesDropdown().then((value) => update());
  }

  Future<List<PedidosResponse>> _getPedidosPendientes() async {
    List<PedidosResponse> res = await _tiendaRepository.getPedidos();

    DateTime newDate = new DateTime.now().subtract(Duration(days: 30));

    return res
        .where((e) => e.idestatus == "1" && e.fecha.compareTo(newDate) > 0)
        .toList();
  }

  Future<void> _getOpcionesDropdown() async {
    (await this._getPedidosPendientes()).forEach((PedidosResponse pedido) {
      this._opcionSeleccionada = pedido.idventa;
      this._listaPedidosPendientes.add(
            DropdownMenuItem(
              child: Text(pedido.idventa),
              value: pedido.idventa,
            ),
          );
    });
  }
}
