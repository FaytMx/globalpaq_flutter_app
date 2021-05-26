import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/controllers/menu_controller.dart';
import 'package:globalpaq_app/app/modules/generaguia/genera_guia_controller.dart';
import 'package:globalpaq_app/app/modules/generaguia/widgets/header.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:globalpaq_app/app/widgets/side_menu.dart';

class GeneraGuiaPage extends StatelessWidget {
  const GeneraGuiaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: Get.find<MenuController>().scaffoldKey,
        drawer: SideMenu(),
        body: GetBuilder<GeneraGuiaController>(builder: (_) {
          if (_.disponibles == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(),
                  falseInput(
                      text:
                          "${_.disponibles.descripcion} ${_.disponibles.peso} KG"),
                  Text(
                    "Remitente",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  crearInput(
                    hintText: "Nombre remitente",
                    labelText: "Nombre",
                    suffixIcon: Icons.account_circle,
                    onChanged: (value) {
                      _.datosGuias.shipperNombre = value;
                    },
                  ),
                  crearInput(
                    hintText: "Compañia remitente",
                    labelText: "Compañia",
                    suffixIcon: Icons.corporate_fare_rounded,
                    onChanged: (value) {
                      _.datosGuias.shipperCompania = value;
                    },
                  ),
                  crearInput(
                    hintText: "Telefono remitente",
                    labelText: "Telefono",
                    suffixIcon: Icons.call_rounded,
                    onChanged: (value) {
                      _.datosGuias.shipperTelefono = value;
                    },
                  ),
                  crearInput(
                    hintText: "Calle y numero remitente",
                    labelText: "Dirección",
                    suffixIcon: Icons.satellite_rounded,
                    onChanged: (value) {
                      _.datosGuias.shipperCalle = value;
                    },
                  ),
                  crearInput(
                    hintText: "Codigo Postal",
                    labelText: "CP",
                    suffixIcon: Icons.markunread_mailbox_rounded,
                    onChanged: (value) {
                      _.datosGuias.shipperCp = value;
                    },
                  ),
                  crearInput(
                    hintText: "Colonia remitente",
                    labelText: "Colonia",
                    suffixIcon: Icons.pin_drop_rounded,
                    onChanged: (value) {
                      _.datosGuias.shipperCalle2 = value;
                    },
                  ),
                  crearInput(
                    hintText: "Ciudad remitente",
                    labelText: "Ciudad",
                    suffixIcon: Icons.map_rounded,
                    onChanged: (value) {
                      _.datosGuias.shipperCiudad = value;
                    },
                  ),
                  crearInput(
                    hintText: "Estado remitente",
                    labelText: "Estado",
                    suffixIcon: Icons.terrain_rounded,
                    onChanged: (value) {
                      _.datosGuias.shipperEstado = value;
                    },
                  ),
                  Text(
                    "Destinatario",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  crearInput(
                    hintText: "Nombre destinatario",
                    labelText: "Nombre",
                    suffixIcon: Icons.account_circle,
                    onChanged: (value) {
                      _.datosGuias.recipientNombre = value;
                    },
                  ),
                  crearInput(
                    hintText: "Compañia destinatario",
                    labelText: "Compañia",
                    suffixIcon: Icons.corporate_fare_rounded,
                    onChanged: (value) {
                      _.datosGuias.recipientCompania = value;
                    },
                  ),
                  crearInput(
                    hintText: "Telefono destinatario",
                    labelText: "Telefono",
                    suffixIcon: Icons.call_rounded,
                    onChanged: (value) {
                      _.datosGuias.recipientNombre = value;
                    },
                  ),
                  crearInput(
                    hintText: "Calle y numero destinatario",
                    labelText: "Dirección",
                    suffixIcon: Icons.satellite_rounded,
                    onChanged: (value) {
                      _.datosGuias.recipientCalle = value;
                    },
                  ),
                  crearInput(
                    hintText: "Codigo Postal",
                    labelText: "CP",
                    suffixIcon: Icons.markunread_mailbox_rounded,
                    onChanged: (value) {
                      _.datosGuias.recipientCp = value;
                    },
                  ),
                  crearInput(
                    hintText: "Colonia destinatario",
                    labelText: "Colonia",
                    suffixIcon: Icons.pin_drop_rounded,
                    onChanged: (value) {
                      _.datosGuias.recipientCalle2 = value;
                    },
                  ),
                  crearInput(
                    hintText: "Ciudad destinatario",
                    labelText: "Ciudad",
                    suffixIcon: Icons.map_rounded,
                    onChanged: (value) {
                      _.datosGuias.recipientCiudad = value;
                    },
                  ),
                  crearInput(
                    hintText: "Estado destinatario",
                    labelText: "Estado",
                    suffixIcon: Icons.terrain_rounded,
                    onChanged: (value) {
                      _.datosGuias.recipientEstado = value;
                    },
                  ),
                  Text(
                    "Paquete",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  crearInput(
                    hintText: "Alto del paquete",
                    labelText: "Alto",
                    suffixIcon: Icons.height_rounded,
                    onChanged: (value) {
                      _.datosGuias.packageLineItemAlto = value;
                    },
                  ),
                  crearInput(
                    hintText: "Largo del paquete",
                    labelText: "Largo",
                    suffixIcon: Icons.arrow_right_alt_rounded,
                    onChanged: (value) {
                      _.datosGuias.packageLineItemLargo = value;
                    },
                  ),
                  crearInput(
                    hintText: "Ancho del paquete",
                    labelText: "Ancho",
                    suffixIcon: Icons.open_in_full_rounded,
                    onChanged: (value) {
                      _.datosGuias.packageLineItemAncho = value;
                    },
                  ),
                  crearInput(
                    hintText: "Peso del paquete",
                    labelText: "Peso",
                    suffixIcon: Icons.line_weight_rounded,
                    onChanged: (value) {
                      _.datosGuias.packageLineItemPeso = value;
                    },
                  ),
                  crearInput(
                    hintText: "Seguro",
                    labelText: "Seguro",
                    suffixIcon: Icons.shield,
                    onChanged: (value) {
                      _.datosGuias.packageLineItemPeso = value;
                    },
                  ),
                  crearInput(
                    hintText: "Contenido del paquete",
                    labelText: "Contenido",
                    suffixIcon: Icons.inventory,
                    onChanged: (value) {},
                  ),
                  ElevatedButton(
                    onPressed: _.generaGuia,
                    child: Text("Generar"),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

Widget crearInput({
  String hintText = "Nombre",
  String labelText = "Nombre",
  IconData suffixIcon = Icons.accessibility,
  Function onChanged,
}) {
  return Container(
    padding: EdgeInsets.all(defaultPadding / 2),
    child: TextField(
      // autofocus: true,
      // textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: hintText,
        labelText: labelText,
        helperText: null,
        suffixIcon: Icon(suffixIcon),
        // icon: Icon(icon),
      ),
      onChanged: onChanged,
    ),
  );
}

Widget falseInput({String text = ""}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(defaultPadding),
    margin: EdgeInsets.all(defaultPadding / 2),
    decoration: BoxDecoration(
      border: Border.all(color: secondaryColor, width: 2),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 16),
    ),
  );
}
