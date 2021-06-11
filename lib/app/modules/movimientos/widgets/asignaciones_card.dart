import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/modules/movimientos/movimientos_controller.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class AsignacionesCard extends StatelessWidget {
  const AsignacionesCard({Key key, @required this.asignacion})
      : super(key: key);

  final AsignacionesResponse asignacion;

  @override
  Widget build(BuildContext context) {
    return _guiaCard(asignacion);
  }
}

Widget _guiaCard(AsignacionesResponse asignacion) {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "${asignacion.descripcion}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DataTable(
            horizontalMargin: 0,
            columnSpacing: defaultPadding,
            columns: [
              DataColumn(label: Text("Fecha")),
              DataColumn(label: Text("Cantidad")),
              DataColumn(label: Text("Venta")),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Center(
                      child: Text("${asignacion.fecha}"),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text("${asignacion.cantidad}"),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text("${asignacion.venta}"),
                    ),
                  ),
                ],
              )
            ],
          ),
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
  );
}
