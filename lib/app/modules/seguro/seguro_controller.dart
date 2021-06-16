import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeguroController extends GetxController {
  String _valorDeclarado;
  String get valorDeclarado => _valorDeclarado;

  void setValorDeclarado(String value) {
    this._valorDeclarado = value;
  }

  double _seguroFedex = 0;
  double _seguroDhl = 0;
  double _seguroEstafeta = 0;
  double _seguroRedpack = 0;
  double _seguroPaquetexp = 0;

  double get seguroFedex => _seguroFedex;
  double get seguroDhl => _seguroDhl;
  double get seguroEstafeta => _seguroEstafeta;
  double get seguroRedpack => _seguroRedpack;
  double get seguroPaquetexp => _seguroPaquetexp;

  void calculaSeguro() {
    if (_valorDeclarado == null) return;
    if (double.tryParse(_valorDeclarado) != null) {
      double valorDeclarado = double.parse(_valorDeclarado);
      if (valorDeclarado < 1000) {
        this._valorDeclarado = null;

        this.alert(
            'Monto', 'El valor declarado debe ser mayor o igual a \$1000.00.');
        return;
      }
      this._seguroFedex = this.calculaSeguroFedex(valorDeclarado);
      this._seguroDhl = this.calculaSeguroDhl(valorDeclarado);
      this._seguroEstafeta = this.calculaSeguroEstafeta(valorDeclarado);
      this._seguroRedpack = this.calculaSeguroRedpack(valorDeclarado);
      this._seguroPaquetexp = this.calculaSeguroPaquetexp(valorDeclarado);

      update();
    } else {
      this._valorDeclarado = null;
      this.alert('Error', 'Ingrese un numero');
      return;
    }
  }

  void alert(String title, String message) {
    Get.dialog(
      AlertDialog(
        title: Text("$title"),
        content: Text("$message"),
        actions: [
          MaterialButton(
              child: Text('OK'),
              onPressed: () {
                Get.back();
              })
        ],
      ),
    );
  }

  double calculaSeguroFedex(double valorDeclarado) {
    double seguro = valorDeclarado * 0.01;
    seguro += 43;
    seguro += 25;

    return seguro.toPrecision(2);
  }

  double calculaSeguroDhl(double valorDeclarado) {
    double valor = valorDeclarado / 1.16;

    if (valor > 7143) {
      double monto = valor * 0.01;
      monto = monto * 1.16;
      monto += 25;
      return monto.toPrecision(2);
    } else {
      double monto = valor * 0;
      monto += 82.86;
      monto += 25;
      return monto.toPrecision(2);
    }
  }

  double calculaSeguroEstafeta(double valorDeclarado) {
    double monto = valorDeclarado * 0.0125;
    monto += 25;
    return monto.toPrecision(2);
  }

  double calculaSeguroRedpack(double valorDeclarado) {
    double valor = valorDeclarado / 1.16;

    if (valor > 3000) {
      double monto = valor * 0.18;
      monto = monto * 1.16;
      monto += 25;

      return monto.toPrecision(2);
    } else {
      double monto = valor * 0;
      double resul = 39.3 * 1.16;
      monto += resul;
      monto += 25;

      return monto.toPrecision(2);
    }
  }

  double calculaSeguroPaquetexp(double valorDeclarado) {
    double monto = valorDeclarado * 0.011;
    monto += 25;
    return monto.toPrecision(2);
  }
}
