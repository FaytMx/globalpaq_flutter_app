import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/envios/envios_controller.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class EnviosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnviosController>(
      builder: (_) => Scaffold(
          body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Historial',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
                child: GridView.count(
                  crossAxisSpacing: defaultPadding / 2,
                  mainAxisSpacing: defaultPadding / 2,
                  childAspectRatio: 3,
                  // scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  children: [
                    ElevatedButton(
                      onPressed: () => _.getHistorial('Fedex'),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        child: Text('Fedex'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _.getHistorial('Dhl'),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        child: Text('DHL'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _.getHistorial('Estafeta'),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        child: Text('Estafeta'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _.getHistorial('Redpack'),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        child: Text('Redpack'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _.getHistorial('Paquetexp'),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        child: Text('Paquetexpress'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: (_.historial.length <= 0)
                    ? Text('Seleccione paqueteria')
                    : Container(
                        child: ListView.builder(
                          itemCount: _.historial.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding / 2),
                            child: HistorialCard(historial: _.historial[index]),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class HistorialCard extends StatelessWidget {
  const HistorialCard({Key key, @required this.historial}) : super(key: key);

  final HistorialResponse historial;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Text(
                  "${historial.tipoguia} (${historial.pesoguia} KG)",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text(
                  "GUIA: ${historial.tracking}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (Get.width * 0.5) - (defaultPadding * 3),
                    child: Text(
                      'Remitente:\n${historial.nombrer}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Container(
                    width: (Get.width * 0.5) - (defaultPadding * 3),
                    child: Text(
                      'Destinatario: \n${historial.nombred}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.download),
                      label: Text('Descargar')),
                ],
              )

              // SizedBox(
              //   width: 200,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text('GENERAR'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
