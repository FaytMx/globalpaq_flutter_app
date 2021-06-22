import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/generaguia/genera_guia_page.dart';
import 'package:globalpaq_app/app/modules/pedidos/pedidos_controller.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:image_picker/image_picker.dart';

class PedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PedidosController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Text(
                    "Pago",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  if (_.listaPedidosPendientes.length > 0)
                    Text("Seleccione su numero de operación:"),
                  if (_.listaPedidosPendientes.length > 0)
                    _crearDropdown(
                      _.listaPedidosPendientes,
                      _.opcionSeleccionada,
                      (opt) => _.setOpcionSeleccionada(opt),
                    ),
                  ListTile(
                    title: Text("Enviar comprobante"),
                    leading: Radio(
                      value: 1,
                      groupValue: _.radioValue,
                      onChanged: (value) => _.setRadioValue(value),
                      activeColor: Colors.green,
                    ),
                  ),
                  ListTile(
                    title: Text("Pagar con saldo prepago"),
                    leading: Radio(
                      value: 2,
                      groupValue: _.radioValue,
                      onChanged: (value) => _.setRadioValue(value),
                      activeColor: Colors.green,
                    ),
                  ),
                  Divider(),
                  if (_.radioValue == 1)
                    EnviarComprobantePago(
                      val: _.radioFormaPagoValue,
                      onChanged: (value) => _.setRadioFormaPagoValue(value),
                      items: _.getOpcionesBanco(),
                      opSel: _.opSelBanco,
                      onChangedSel: (opt) => _.setOpSelBanco(opt),
                      fechaController: _.inputFieldDateController,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EnviarComprobantePago extends StatelessWidget {
  const EnviarComprobantePago({
    Key key,
    this.val = -1,
    this.onChanged,
    this.items,
    this.opSel,
    this.onChangedSel,
    this.fechaController,
  }) : super(key: key);

  final int val;
  final Function onChanged;
  final List<DropdownMenuItem<String>> items;
  final String opSel;
  final Function onChangedSel;
  final TextEditingController fechaController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text("Banco"),
            leading: Radio(
              value: 1,
              groupValue: val,
              onChanged: (value) => this.onChanged(value),
              activeColor: Colors.green,
            ),
          ),
          if (val == 1) _crearDropdown(items, opSel, onChangedSel),
          ListTile(
            title: Text("PAYPAL(pagos@globalpaq.com)"),
            leading: Radio(
              value: 2,
              groupValue: val,
              onChanged: (value) => this.onChanged(value),
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("MERCADOPAGO(pagos@globalpaq.com)"),
            leading: Radio(
              value: 3,
              groupValue: val,
              onChanged: (value) => this.onChanged(value),
              activeColor: Colors.green,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          _crearFecha(context, fechaController),
          crearInput(
            hintText: "1000.00",
            labelText: "Monto",
            suffixIcon: Icons.monetization_on_rounded,
          ),
          IconButton(
            onPressed: _seleccionarFoto,
            icon: Icon(Icons.photo_size_select_actual_outlined),
          ),
          _mostrarFoto(),
          OutlinedButton(
              onPressed: () {
                Get.find<PedidosController>().sendComprobante();
              },
              child: Text('Enviar')),
        ],
      ),
    );
  }

  Widget _mostrarFoto() {
    final File foto = Get.find<PedidosController>().foto;

    if (foto != null) {
      return Image.file(
        foto,
        fit: BoxFit.cover,
        height: 200.0,
      );
    }
    return Image(
      image: AssetImage(foto?.path ?? 'assets/images/no-image.png'),
      height: 200,
      fit: BoxFit.cover,
    );
  }

  _seleccionarFoto() {
    _procesarImagen(ImageSource.gallery);
  }

  _procesarImagen(ImageSource origen) async {
    final _picker = ImagePicker();
    final PickedFile pickedFile = await _picker.getImage(source: origen);
    if (pickedFile == null) return;

    final File file = File(pickedFile.path);
    Get.find<PedidosController>().setFoto(file);
    if (file != null) {}
  }
}

Widget _crearDropdown(
  List<DropdownMenuItem<String>> lista,
  String opcionSeleccionada,
  Function onChanged,
) {
  return Row(
    children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(
        width: 30,
      ),
      Expanded(
        child: DropdownButton(
          isExpanded: true,
          value: opcionSeleccionada,
          items: lista,
          onChanged: (opt) => onChanged(opt),
        ),
      ),
    ],
  );
}

Widget _crearFecha(
    BuildContext context, TextEditingController fechaController) {
  return TextField(
    enableInteractiveSelection: false,
    controller: fechaController,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: 'Fecha',
      labelText: 'Fecha',
      suffixIcon: Icon(Icons.perm_contact_calendar),
      // icon: Icon(Icons.calendar_today),
    ),
    onTap: () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'MX'),
      );

      if (picked != null) {
        Get.find<PedidosController>().setFecha(picked.toString());
        Get.find<PedidosController>()
            .setInputFieldDateController(picked.toString());
      }
    },
  );
}
