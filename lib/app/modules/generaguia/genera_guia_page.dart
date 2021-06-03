import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/controllers/menu_controller.dart';
import 'package:globalpaq_app/app/modules/generaguia/genera_guia_controller.dart';
import 'package:globalpaq_app/app/modules/generaguia/widgets/header.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:globalpaq_app/app/widgets/side_menu.dart';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';

class GeneraGuiaPage extends StatelessWidget {
  const GeneraGuiaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<AutoCompleteTextFieldState<String>> keyCpRemitente = GlobalKey();
    GlobalKey<AutoCompleteTextFieldState<String>> keyCpDestinatario =
        GlobalKey();

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
                    textValue: _.datosGuias.shipperNombre,
                    onChanged: (value) {
                      _.datosGuias.shipperNombre = value;
                    },
                  ),
                  crearInput(
                    hintText: "Compañia remitente",
                    labelText: "Compañia",
                    suffixIcon: Icons.corporate_fare_rounded,
                    textValue: _.datosGuias.shipperCompania,
                    onChanged: (value) {
                      _.datosGuias.shipperCompania = value;
                    },
                  ),
                  crearInput(
                    hintText: "Telefono remitente",
                    labelText: "Telefono",
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.call_rounded,
                    textValue: _.datosGuias.shipperTelefono,
                    onChanged: (value) {
                      _.datosGuias.shipperTelefono = value;
                    },
                  ),
                  if (_.isPaquetexp)
                    crearInput(
                      hintText: "Correo remitente",
                      labelText: "Email",
                      keyboard: TextInputType.emailAddress,
                      suffixIcon: Icons.email_rounded,
                      textValue: _.datosGuias.shipperEmail,
                      onChanged: (value) {
                        _.datosGuias.shipperEmail = value;
                      },
                    ),
                  crearInput(
                    hintText: "Calle y numero remitente",
                    labelText: "Dirección",
                    suffixIcon: Icons.satellite_rounded,
                    textValue: _.datosGuias.shipperCalle,
                    onChanged: (value) {
                      _.datosGuias.shipperCalle = value;
                    },
                  ),
                  if (_.isRedpack)
                    crearInput(
                      hintText: "Numero ext",
                      labelText: "Numero ext",
                      keyboard: TextInputType.number,
                      suffixIcon: Icons.format_list_numbered_rounded,
                      textValue: _.datosGuias.shipperNumExt,
                      onChanged: (value) {
                        _.datosGuias.shipperNumExt = value;
                      },
                    ),
                  crearInput(
                    hintText: "Codigo Postal",
                    labelText: "CP",
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.markunread_mailbox_rounded,
                    textValue: _.datosGuias.shipperCp,
                    onChanged: (value) {
                      _.datosGuias.shipperCp = value;
                      _.getDirs(value);
                    },
                  ),
                  AutoCompleteColony(
                      keyCp: keyCpRemitente,
                      coloniasList: _.coloniasList,
                      onChanged: (value) {
                        _.datosGuias.shipperCalle2 = value;
                      }),
                  // crearInput(
                  //   hintText: "Colonia remitente",
                  //   labelText: "Colonia",
                  //   suffixIcon: Icons.pin_drop_rounded,
                  //   onChanged: (value) {
                  //     _.datosGuias.shipperCalle2 = value;
                  //   },
                  // ),
                  crearInput(
                    hintText: "Ciudad remitente",
                    labelText: "Ciudad",
                    suffixIcon: Icons.map_rounded,
                    textValue: _.ciudadHint,
                    onChanged: (value) {
                      _.datosGuias.shipperCiudad = value;
                    },
                  ),
                  crearInput(
                    hintText: "Estado remitente",
                    labelText: "Estado",
                    suffixIcon: Icons.terrain_rounded,
                    textValue: _.estadoHint,
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
                    textValue: _.datosGuias.recipientNombre,
                    onChanged: (value) {
                      _.datosGuias.recipientNombre = value;
                    },
                  ),
                  crearInput(
                    hintText: "Compañia destinatario",
                    labelText: "Compañia",
                    suffixIcon: Icons.corporate_fare_rounded,
                    textValue: _.datosGuias.recipientCompania,
                    onChanged: (value) {
                      _.datosGuias.recipientCompania = value;
                    },
                  ),
                  crearInput(
                    hintText: "Telefono destinatario",
                    labelText: "Telefono",
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.call_rounded,
                    textValue: _.datosGuias.recipientTelefono,
                    onChanged: (value) {
                      _.datosGuias.recipientTelefono = value;
                    },
                  ),
                  if (_.isPaquetexp)
                    crearInput(
                      hintText: "Correo destinatario",
                      labelText: "Email",
                      keyboard: TextInputType.emailAddress,
                      suffixIcon: Icons.email_rounded,
                      textValue: _.datosGuias.recipientEmail,
                      onChanged: (value) {
                        _.datosGuias.recipientEmail = value;
                      },
                    ),
                  crearInput(
                    hintText: "Calle y numero destinatario",
                    labelText: "Dirección",
                    suffixIcon: Icons.satellite_rounded,
                    textValue: _.datosGuias.recipientCalle,
                    onChanged: (value) {
                      _.datosGuias.recipientCalle = value;
                    },
                  ),
                  if (_.isRedpack)
                    crearInput(
                      hintText: "Numero ext",
                      labelText: "Numero ext",
                      keyboard: TextInputType.number,
                      suffixIcon: Icons.format_list_numbered_rounded,
                      textValue: _.datosGuias.recipientNumExt,
                      onChanged: (value) {
                        _.datosGuias.recipientNumExt = value;
                      },
                    ),
                  crearInput(
                    hintText: "Codigo Postal",
                    labelText: "CP",
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.markunread_mailbox_rounded,
                    textValue: _.datosGuias.recipientCp,
                    onChanged: (value) {
                      _.datosGuias.recipientCp = value;
                      _.getDirs(value);
                    },
                  ),
                  AutoCompleteColony(
                      keyCp: keyCpDestinatario,
                      coloniasList: _.coloniasList,
                      onChanged: (value) {
                        _.datosGuias.recipientCalle2 = value;
                      }),
                  // crearInput(
                  //   hintText: "Colonia destinatario",
                  //   labelText: "Colonia",
                  //   suffixIcon: Icons.pin_drop_rounded,
                  //   onChanged: (value) {
                  //     _.datosGuias.recipientCalle2 = value;
                  //   },
                  // ),
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
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.height_rounded,
                    textValue: _.datosGuias.packageLineItemAlto.toString(),
                    onChanged: (value) {
                      _.datosGuias.packageLineItemAlto = int.parse(value);
                    },
                  ),
                  crearInput(
                    hintText: "Largo del paquete",
                    labelText: "Largo",
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.arrow_right_alt_rounded,
                    textValue: _.datosGuias.packageLineItemAlto.toString(),
                    onChanged: (value) {
                      _.datosGuias.packageLineItemLargo = int.parse(value);
                    },
                  ),
                  crearInput(
                    hintText: "Ancho del paquete",
                    labelText: "Ancho",
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.open_in_full_rounded,
                    textValue: _.datosGuias.packageLineItemAncho.toString(),
                    onChanged: (value) {
                      _.datosGuias.packageLineItemAncho = int.parse(value);
                    },
                  ),
                  crearInput(
                    hintText: "Peso del paquete",
                    labelText: "Peso",
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.line_weight_rounded,
                    textValue: _.datosGuias.packageLineItemPeso.toString(),
                    onChanged: (String value) {
                      _.datosGuias.packageLineItemPeso = int.parse(value);
                    },
                  ),
                  crearInput(
                    hintText: "Seguro",
                    labelText: "Seguro",
                    keyboard: TextInputType.number,
                    suffixIcon: Icons.shield,
                    textValue: _.datosGuias.packageLineItemValor.toString(),
                    onChanged: (value) {
                      _.datosGuias.packageLineItemValor = value;
                    },
                  ),
                  crearInput(
                    hintText: "Contenido del paquete",
                    labelText: "Contenido",
                    suffixIcon: Icons.inventory,
                    textValue: _.datosGuias.packageLineItemContenido,
                    onChanged: (value) {
                      _.datosGuias.packageLineItemContenido = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: _.isProccessing ? null : _.generaGuia,
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

class AutoCompleteColony extends StatelessWidget {
  const AutoCompleteColony({
    Key key,
    @required this.keyCp,
    this.coloniasList,
    this.onChanged,
  }) : super(key: key);

  final GlobalKey<AutoCompleteTextFieldState<String>> keyCp;
  final List<String> coloniasList;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: SimpleAutoCompleteTextField(
        key: keyCp,
        suggestions: coloniasList,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Colonia remitente",
          labelText: "Colonia",
          suffixIcon: Icon(Icons.pin_drop_rounded),
          // icon: Icon(icon),
        ),
        textChanged: onChanged,
      ),
    );
  }
}

Widget crearInput({
  String hintText = "Nombre",
  String labelText = "Nombre",
  IconData suffixIcon = Icons.accessibility,
  Function onChanged,
  TextInputType keyboard = TextInputType.text,
  String textValue = "",
}) {
  return Container(
    padding: EdgeInsets.all(defaultPadding / 2),
    child: TextField(
      keyboardType: keyboard,
      controller: TextEditingController(text: textValue),
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
