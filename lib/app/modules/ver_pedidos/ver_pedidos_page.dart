import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedidos_response.dart';
import 'package:globalpaq_app/app/modules/ver_pedidos/ver_pedidos_controller.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:intl/intl.dart';

class VerPedidosPage extends StatelessWidget {
  const VerPedidosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerPedidosController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Text("Historial de pedidos",
                    style: Theme.of(context).textTheme.headline5),
                Expanded(
                  child: Stack(
                    children: <Widget>[_crearLista(), _crearLoading()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearLista() {
    VerPedidosController _vpc = Get.find<VerPedidosController>();
    return RefreshIndicator(
      onRefresh: _vpc.getPedidos,
      child: ListView.builder(
        controller: _vpc.scrollController,
        itemBuilder: (BuildContext context, int index) {
          PedidosResponse pedido = _vpc.pedidos[index];

          return PedidosCard(pedido: pedido);
        },
        itemCount: _vpc.pedidos.length,
      ),
    );
  }

  Widget _crearLoading() {
    if (Get.find<VerPedidosController>().isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}

class PedidosCard extends StatelessWidget {
  const PedidosCard({Key key, @required this.pedido}) : super(key: key);

  final PedidosResponse pedido;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(pedido.fecha);

    Color colorPedido = Colors.white;

    switch (int.parse(pedido.idestatus)) {
      case 1:
        colorPedido = Colors.lightBlue;
        break;
      case 8:
        colorPedido = Colors.red;
        break;
      case 3:
      case 6:
        colorPedido = Colors.green;
        break;
      default:
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  color: colorPedido.withOpacity(0.8),
                  width: 5,
                  height: 130,
                ),
                Container(
                  width: 150,
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Folio",
                          style: Theme.of(context).textTheme.headline6),
                      Text("${pedido.idventa}",
                          style: Theme.of(context).textTheme.headline5),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${pedido.estatus}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Total:"),
                            Text("\$${pedido.total}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Fecha:"),
                            Text("$formatted"),
                          ],
                        ),
                        Container(
                          child: OutlinedButton(onPressed: (){}, child: Text("Detalles")),
                        ),
                      ],
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


// Container(
//                       padding: EdgeInsets.all(defaultPadding / 2),
//                       child: DataTable(
//                         horizontalMargin: 0,
//                         columnSpacing: defaultPadding,
//                         columns: [
//                           DataColumn(label: Text("Aticulo")),
//                           DataColumn(label: Text("Cantidad")),
//                           DataColumn(label: Text("Precio")),
//                         ],
//                         rows: [
//                           DataRow(
//                             cells: [
//                               DataCell(Text(
//                                   "CAJA SOBRES JIFFYLITE 0 18.2 * 23.9 250 PIEZAS 25 KG")),
//                               DataCell(Text("1")),
//                               DataCell(Text("7779.99")),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),