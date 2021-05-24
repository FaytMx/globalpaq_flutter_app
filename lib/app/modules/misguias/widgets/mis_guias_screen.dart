import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/misguias/mis_guias_controller.dart';
import 'package:globalpaq_app/app/modules/misguias/widgets/header.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
// import 'package:globalpaq_app/app/utils/responsive.dart';

class MisGuiasScreen extends StatelessWidget {
  final List<String> paqueterias = Get.find<MisGuiasController>().paqueterias;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
            ),
            Text(
              "Mis Guias",
              style: Theme.of(context).textTheme.headline5,
            ),
            GetBuilder<MisGuiasController>(builder: (_) {
              if (_.disponibles.length == 0) {
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: paqueterias.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                      crossAxisCount: 1,
                      crossAxisSpacing: defaultPadding,
                      mainAxisSpacing: defaultPadding,
                      childAspectRatio: 5),
                  itemBuilder: (context, index) => Container(
                    width: Get.width / 2.2,
                    child: ElevatedButton(
                      onPressed: () {
                        _.getDisp(paqueterias[index]);
                      },
                      child: Text(paqueterias[index]),
                    ),
                  ),
                );
              }
              return Container(
                height: Get.height * 0.8,
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: _.disponibles.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: _guiaCard(_.disponibles[index]),
                  ),
                ),
              );
            }),
            Divider(),
          ],
        ),
      ),
    );
  }
}

Widget _guiaCard(dynamic disponible) {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(
            " ${disponible.peso} KG",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Column(
            children: [
              Text("${disponible.descripcion}"),
              DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(label: Text("Total")),
                  DataColumn(label: Text("Usadas")),
                  DataColumn(label: Text("Disponibles")),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text("${disponible.total}"),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text("${disponible.usadas}"),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text("${disponible.disponibles}"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('GENERAR'),
                ),
              ),
            ],
          ),
        )
      ],
    ),
    // child: Column(
    //   children: <Widget>[
    //     ListTile(
    //       leading: Icon(Icons.photo_album, color: Colors.blue),
    //       title: Text("${disponible.descripcion} ${disponible.peso} KG"),

    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(defaultPadding),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text("${disponible.total}"),
    //           Text("${disponible.usadas}"),
    //           Text("${disponible.disponibles}"),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       width: double.infinity,
    //       child:  TextButton(onPressed: () {}, child:  Text('GENERAR')),
    //     ),

    //   ],
    // ),
  );
}
