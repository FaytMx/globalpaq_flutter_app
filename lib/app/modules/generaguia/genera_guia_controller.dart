import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/guias_disponibles.dart';

class DatosGuia {
  int guiaTipo;
  int guiaPeso;
  String guiaRec;
  String shipperNombre;
  String shipperCompania;
  String shipperTelefono;
  String shipperCalle;
  String shipperCalle2;
  String shipperCiudad;
  String shipperEstado;
  String shipperCp;
  String recipientNombre;
  String recipientCompania;
  String recipientTelefono;
  String recipientCalle;
  String recipientCalle2;
  String recipientCiudad;
  String recipientEstado;
  String recipientCp;
  int packageLineItemPeso;
  int packageLineItemLargo;
  int packageLineItemAncho;
  int packageLineItemAlto;
  String packageLineItemValor;

  DatosGuia({
    this.guiaTipo,
    this.guiaPeso,
    this.guiaRec,
    this.shipperNombre,
    this.shipperCompania,
    this.shipperTelefono,
    this.shipperCalle,
    this.shipperCalle2,
    this.shipperCiudad,
    this.shipperEstado,
    this.shipperCp,
    this.recipientNombre,
    this.recipientCompania,
    this.recipientTelefono,
    this.recipientCalle,
    this.recipientCalle2,
    this.recipientCiudad,
    this.recipientEstado,
    this.recipientCp,
    this.packageLineItemPeso,
    this.packageLineItemLargo,
    this.packageLineItemAncho,
    this.packageLineItemAlto,
    this.packageLineItemValor,
  });
}

class GeneraGuiaController extends GetxController {
  GuiasDisponibles _disponibles;
  GuiasDisponibles get disponibles => _disponibles;

  DatosGuia _datosGuias = new DatosGuia();
  DatosGuia get datosGuias => _datosGuias;

  @override
  void onReady() {
    super.onReady();
    this.init();
  }

  void init() async {
    GuiasDisponibles disponibles = await Get.arguments;
    this._disponibles = disponibles;
    update();
  }

  void generaGuia() {
    print(_datosGuias);
    print("🧨 ${_datosGuias.shipperNombre}");
  }
}
