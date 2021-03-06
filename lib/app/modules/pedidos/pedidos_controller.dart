import 'dart:io';
import 'dart:async';
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

  String _opSelBanco = "BANCOMER terminación 1738";
  String get opSelBanco => _opSelBanco;
  void setOpSelBanco(String value) {
    this._opSelBanco = value;
    update();
  }

  int _radioValue = -1;
  int get radioValue => _radioValue;

  void setRadioValue(int value) {
    this._radioValue = value;
    update();
  }

  int _radioFormaPagoValue = -1;
  int get radioFormaPagoValue => _radioFormaPagoValue;

  void setRadioFormaPagoValue(int value) {
    this._radioFormaPagoValue = value;
    update();
  }

  String _fecha = '';
  String get fecha => _fecha;
  void setFecha(String value) {
    _fecha = value;
  }

  TextEditingController _inputFieldDateController = new TextEditingController();
  TextEditingController get inputFieldDateController =>
      _inputFieldDateController;
  void setInputFieldDateController(String value) {
    _inputFieldDateController.text = value;
    update();
  }

  File _foto;
  File get foto => _foto;

  setFoto(File value) {
    _foto = value;
    update();
  }

  double _monto = 0;
  double get monto => _monto;

  setMonto(String value) {
    if (double.tryParse(value) != null) {
      this._monto = double.parse(value);
    }
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
    List<PedidosResponse> res = await _tiendaRepository.getPedidos("1000","1");

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

  List<DropdownMenuItem<String>> getOpcionesBanco() {
    List<DropdownMenuItem<String>> lista = [];

    lista.add(
      DropdownMenuItem(
        child: Text("BANCOMER terminación 1738"),
        value: "BANCOMER terminación 1738",
      ),
    );
    lista.add(
      DropdownMenuItem(
        child: Text("HSBC Terminación 8684"),
        value: "HSBC Terminación 8684",
      ),
    );
    lista.add(
      DropdownMenuItem(
        child: Text("BBVA PAOLA 2046"),
        value: "BBVA PAOLA 2046",
      ),
    );

    return lista;
  }

  void sendComprobante() async {
    print(this._opSelBanco);
    print(this._opcionSeleccionada);
    print(this._radioFormaPagoValue);
    print(this._radioValue);
    print(this._fecha);

    if (this._foto != null &&
        this._opcionSeleccionada != null &&
        this._fecha != null &&
        this._monto > 0) {
      Map<String, dynamic> data = {};

      String tipoBanco;

      switch (this._radioFormaPagoValue) {
        case 1:
          tipoBanco = this._opSelBanco;
          break;
        case 2:
          tipoBanco = "PAYPAL";
          break;
        case 3:
          tipoBanco = "MERCADOPAGO";
          break;
        default:
          tipoBanco = "";
      }

      data['idventa'] = this._opcionSeleccionada;
      data['tipo_banco'] = tipoBanco;
      data['fecha_pago'] = this._fecha;
      data['monto'] = this._monto;

      try {
        await this._tiendaRepository.postCoprobantePedido(data, this._foto);
        this._foto = null;
        this._opcionSeleccionada = null;
        this._opSelBanco = null;
        this._fecha = null;
        this._monto = 0;
        this._radioFormaPagoValue = null;
        this._radioValue = null;
        this._inputFieldDateController.text = "";

        update();
      } catch (e) {
        print(e);
      }
    } else {
      print("Faltan datos");
    }
  }
}
