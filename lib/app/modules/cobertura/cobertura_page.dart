import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/cobertura/cobertura_controller.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:globalpaq_app/app/widgets/crea_input.dart';
import 'package:globalpaq_app/app/widgets/input_text.dart';

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
                    child: Text('Consultar')),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [],
                      ),
                    ),
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
