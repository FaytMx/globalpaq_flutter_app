import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/seguro/seguro_controller.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:globalpaq_app/app/widgets/crea_input.dart';

class SeguroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguroController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              width: double.infinity,
              height: Get.height - defaultPadding * 3,
              child: Column(
                children: [
                  Text(
                    'Cotizador de seguros',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Text(
                    'Selecciona una paquetería y escribe el valor declarado de tu paquete para saber el costo por asegurarlo.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  CreaInput(
                    hintText: "1000.00",
                    keyboard: TextInputType.number,
                    textValue: _.valorDeclarado,
                    labelText: "Valor declarado",
                    suffixIcon: Icons.shield,
                    onChanged: (value) => _.setValorDeclarado(value),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _.calculaSeguro();
                      this.hideKeyboard(context);
                    },
                    child: Text('Cotizar'),
                  ),
                  Divider(),
                  (_.valorDeclarado != null)
                      ? Text('Asegurar tu paquete te cuesta:',
                          style: TextStyle(fontSize: 20))
                      : Container(),
                  Expanded(
                    child: (_.valorDeclarado != null)
                        ? _DatosSeguro(
                            seguroFedex: _.seguroFedex,
                            seguroDhl: _.seguroDhl,
                            seguroEstafeta: _.seguroEstafeta,
                            seguroRedpack: _.seguroRedpack,
                            seguroPaquetexp: _.seguroPaquetexp,
                          )
                        : Container(),
                  ),
                  Text(
                    "*Las paqueterías ESTAFETA y REDPACK cobran deducible de 20% del valor declarado en caso de siniestro. Los precios aquí señalados son de referencia y están sujetos a cambios sin previo aviso.\n Si tienes alguna duda contacta a un asesor Globalpaq.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

class _DatosSeguro extends StatelessWidget {
  const _DatosSeguro({
    Key key,
    this.seguroFedex,
    this.seguroDhl,
    this.seguroEstafeta,
    this.seguroRedpack,
    this.seguroPaquetexp,
  }) : super(key: key);

  final double seguroFedex;
  final double seguroDhl;
  final double seguroEstafeta;
  final double seguroRedpack;
  final double seguroPaquetexp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fedex',
                style: TextStyle(fontSize: 20, color: fedexColor),
              ),
              Text('\$$seguroFedex'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DHL',
                style: TextStyle(fontSize: 20, color: dhlColor),
              ),
              Text('\$$seguroDhl'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Estafeta',
                style: TextStyle(fontSize: 20, color: estafetaColor),
              ),
              Text('\$$seguroEstafeta'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Redpack',
                style: TextStyle(fontSize: 20, color: redpackColor),
              ),
              Text('\$$seguroRedpack'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Paquetexpress',
                style: TextStyle(fontSize: 20, color: paquetexpressColor),
              ),
              Text('\$$seguroPaquetexp'),
            ],
          ),
        ],
      ),
    );
  }
}
