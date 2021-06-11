import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/movimientos/movimientos_controller.dart';
import 'package:globalpaq_app/app/modules/movimientos/widgets/asignaciones_card.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class MovimientosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovimientosController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Asignaciones'),
                Text('Seleccion de paqueteria'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () => _.getMovimientos('Fedex'),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: Text('Fedex'),
                        )),
                    ElevatedButton(
                        onPressed: () => _.getMovimientos('Dhl'),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: Text('DHL'),
                        )),
                    ElevatedButton(
                        onPressed: () => _.getMovimientos('Estafeta'),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: Text('Estafeta'),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () => _.getMovimientos('Redpack'),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: Text('Redpack'),
                        )),
                    ElevatedButton(
                        onPressed: () => _.getMovimientos('Paquetexp'),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: Text('Paquetexp'),
                        )),
                  ],
                ),
                Expanded(
                  child: (_.asignaciones.length > 0)
                      ? ListView.builder(
                          // shrinkWrap: true,
                          itemCount: _.asignaciones.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding / 2),
                            child: AsignacionesCard(
                              asignacion: _.asignaciones[index],
                            ),
                          ),
                        )
                      : Text('Seleccione una paqueteria'),
                )
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: Container(
                //       width: double.infinity,
                //       child: Column(
                //         children: [
                //           for (var i = 0; i < 200; i++) AsignacionesCard()
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
