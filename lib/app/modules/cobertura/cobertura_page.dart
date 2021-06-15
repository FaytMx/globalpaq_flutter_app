import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/cobertura/cobertura_controller.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:globalpaq_app/app/widgets/crea_input.dart';

class CoberturaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoberturaController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Consulta de cobertura'),
                Text(
                    'Ingrese el codigo postal de origen y el codigo postal de destino para mostrar los servicios que ofrece cada paqueteria.'),
                CreaInput(
                  labelText: 'Codigo Postal Origen',
                  hintText: '54435',
                  suffixIcon: Icons.location_pin,
                  keyboard: TextInputType.number,
                  onChanged: (String value) => _.cpOrigenSet(value),
                ),
                CreaInput(
                  labelText: 'Codigo Postal Destino',
                  hintText: '95085',
                  suffixIcon: Icons.location_pin,
                  keyboard: TextInputType.number,
                  onChanged: (value) => _.cpDestinoSet(value),
                ),
                ElevatedButton(
                  onPressed: () => _.buscaCobertura(),
                  child: Text('Consultar'),
                ),
                if (_.coberturaFedex != null)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Divider(),
                              Text(
                                'Servicios',
                                style: TextStyle(fontSize: 22),
                              ),
                              if (_.coberturaFedex != null)
                                CardCobertura(
                                  cobertura: _.coberturaFedex,
                                  paqueteria: "Fedex",
                                  color: fedexColor,
                                ),
                              if (_.coberturaDhl != null)
                                CardCobertura(
                                  cobertura: _.coberturaDhl,
                                  paqueteria: "DHL",
                                  color: dhlColor,
                                ),
                              if (_.coberturaEstafeta != null)
                                CardCobertura(
                                  cobertura: _.coberturaEstafeta,
                                  paqueteria: "Estafeta",
                                  color: estafetaColor,
                                ),
                              if (_.coberturaRedpack != null)
                                CardCobertura(
                                  cobertura: _.coberturaRedpack,
                                  paqueteria: "Redpack",
                                  color: redpackColor,
                                ),
                              if (_.coberturaPaquetexp != null)
                                CardCobertura(
                                  cobertura: _.coberturaPaquetexp,
                                  paqueteria: "Paquetexpress",
                                  color: paquetexpressColor,
                                ),
                            ],
                          )),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardCobertura extends StatelessWidget {
  const CardCobertura(
      {Key key,
      this.cobertura,
      this.paqueteria = "",
      this.color = Colors.white})
      : super(key: key);

  final CoberturaPaqueterias cobertura;
  final String paqueteria;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '$paqueteria',
            style: TextStyle(fontSize: 20, color: color),
          ),
          Text(cobertura.cobertura, style: TextStyle(fontSize: 16)),
          if (cobertura.ocurre != null)
            Text("Ocurre: ${cobertura.ocurre}", style: TextStyle(fontSize: 14)),
          SizedBox(
            height: 10,
          ),
          if (cobertura.servicios.length > 0)
            for (var i = 0; i < cobertura.servicios.length; i++)
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(cobertura.servicios[i]),
                ],
              ),
          Divider(),
        ],
      ),
    );
  }
}
