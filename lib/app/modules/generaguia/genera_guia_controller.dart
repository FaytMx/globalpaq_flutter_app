import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/guias_disponibles.dart';
import 'package:globalpaq_app/app/data/models/requests/dhl/dhl_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/requests/estafeta/estafeta_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/requests/fedex/fedex_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/requests/paquetexp/paquetexp_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/requests/redpack/redpack_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_cp_response.dart';
import 'package:globalpaq_app/app/data/repositories/remote/dhl_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/estafeta_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/fedex_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/paquetexp_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/redpack_repository.dart';

const List<int> tipoFedex = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  14,
  17,
  33,
  34,
  35,
  36,
  41,
  42,
  43,
  44,
  50,
  51,
  52,
  53,
  54,
  55,
  56,
  57,
  58,
  59,
  60,
  61,
];
const List<int> tipoDhl = [
  12,
  13,
  18,
  19,
  20,
  21,
  24,
  31,
  32,
  39,
  40,
];
const List<int> tipoRedpack = [26, 27];
const List<int> tipoPaquetexp = [48, 49];
const List<int> tipoEstafeta = [
  15,
  16,
  22,
  23,
  28,
  29,
  30,
  37,
  38,
];

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
  String packageLineItemContenido;
  String shipperNumExt;
  String recipientNumExt;
  String shipperEmail;
  String recipientEmail;

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
    this.packageLineItemContenido,
    this.shipperNumExt,
    this.recipientNumExt,
    this.shipperEmail,
    this.recipientEmail,
  });
}

class GeneraGuiaController extends GetxController {
//servicios
  final FedexRepository _fedexRepository = Get.find<FedexRepository>();
  final DhlRepository _dhlRepository = Get.find<DhlRepository>();
  final EstafetaRepository _estafetaRepository = Get.find<EstafetaRepository>();
  final RedpackRepository _redpackRepository = Get.find<RedpackRepository>();
  final PaquetexpRepository _paquetexpRepository =
      Get.find<PaquetexpRepository>();
//datos

  GuiasDisponibles _disponibles;
  GuiasDisponibles get disponibles => _disponibles;

  DatosGuia _datosGuias = new DatosGuia();
  DatosGuia get datosGuias => _datosGuias;

  bool _isFedex = false;
  bool get isFedex => _isFedex;

  bool _isDHL = false;
  bool get isDHL => _isDHL;

  bool _isEstafeta = false;
  bool get isEstafeta => _isEstafeta;

  bool _isRedpack = false;
  bool get isRedpack => _isRedpack;

  bool _isPaquetexp = false;
  bool get isPaquetexp => _isPaquetexp;

  bool _isProccessing = false;
  bool get isProccessing => _isProccessing;

  List<String> _coloniasList = [];
  List<String> get coloniasList => _coloniasList;

  String _ciudadHint = "";
  String get ciudadHint => _ciudadHint;

  String _estadoHint = "";
  String get estadoHint => _estadoHint;

//ciclos de vida
  @override
  void onReady() {
    super.onReady();
    this.init();
  }

//funciones

  getTipo() {
    int tipo = int.parse(_disponibles.tipo);

    if (tipoFedex.contains(tipo)) {
      _isFedex = true;
    } else if (tipoDhl.contains(tipo)) {
      _isDHL = true;
    } else if (tipoEstafeta.contains(tipo)) {
      _isEstafeta = true;
    } else if (tipoRedpack.contains(tipo)) {
      _isRedpack = true;
    } else if (tipoPaquetexp.contains(tipo)) {
      _isPaquetexp = true;
    }
  }

//metodos
  void init() async {
    GuiasDisponibles disponibles = await Get.arguments;
    this._disponibles = disponibles;

    getTipo();

    update();
  }

  void generaGuia() {
    _isProccessing = true;
    // int tipo = int.parse(_disponibles.tipo);
    if (this._isFedex) {
      this._generaFedex().then((value) {
        _isProccessing = false;
        update();
      });
    } else if (this._isDHL) {
      this._generaDhl().then((value) {
        _isProccessing = false;
        update();
      });
    } else if (this._isEstafeta) {
      this._generaEstafeta().then((value) {
        _isProccessing = false;
        update();
      });
    } else if (this._isRedpack) {
      this._generaRedpack().then((value) {
        _isProccessing = false;
        update();
      });
    } else if (this._isPaquetexp) {
      this._generaPaquetexp().then((value) {
        _isProccessing = false;
        update();
      });
    }
  }

  Future<void> _generaFedex() async {
    FedexPostGuiaRequest guiaFedex = new FedexPostGuiaRequest(
      guiaTipo: int.parse(_disponibles.tipo),
      guiaPeso: _disponibles.peso,
      guiaRec: "",
      shipperNombre: _datosGuias.shipperNombre,
      shipperCompania: _datosGuias.shipperCompania,
      shipperTelefono: _datosGuias.shipperTelefono,
      shipperCalle: _datosGuias.shipperCalle,
      shipperCalle2: _datosGuias.shipperCalle2,
      shipperCiudad: _datosGuias.shipperCiudad,
      shipperEstado: _datosGuias.shipperEstado,
      shipperCp: _datosGuias.shipperCp,
      recipientNombre: _datosGuias.recipientNombre,
      recipientCompania: _datosGuias.recipientCiudad,
      recipientTelefono: _datosGuias.recipientTelefono,
      recipientCalle: _datosGuias.recipientCalle,
      recipientCalle2: _datosGuias.recipientCalle2,
      recipientCiudad: _datosGuias.recipientCiudad,
      recipientEstado: _datosGuias.recipientEstado,
      recipientCp: _datosGuias.recipientCp,
      packageLineItemPeso: _datosGuias.packageLineItemPeso,
      packageLineItemLargo: _datosGuias.packageLineItemLargo,
      packageLineItemAncho: _datosGuias.packageLineItemAncho,
      packageLineItemAlto: _datosGuias.packageLineItemAlto,
      packageLineItemValor: _datosGuias.packageLineItemValor,
    );

    try {
      var data = await _fedexRepository.postFedexGuia(guiaFedex);
      print(data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _generaDhl() async {
    DhlPostGuiaRequest guiaDhl = new DhlPostGuiaRequest(
      guiaTipo: int.parse(_disponibles.tipo),
      guiaPeso: _disponibles.peso,
      guiaRec: "",
      shipperNombre: _datosGuias.shipperNombre,
      shipperCompania: _datosGuias.shipperCompania,
      shipperTelefono: _datosGuias.shipperTelefono,
      shipperCalle: _datosGuias.shipperCalle,
      shipperCalle2: _datosGuias.shipperCalle2,
      shipperCiudad: _datosGuias.shipperCiudad,
      shipperEstado: _datosGuias.shipperEstado,
      shipperCp: _datosGuias.shipperCp,
      recipientNombre: _datosGuias.recipientNombre,
      recipientCompania: _datosGuias.recipientCompania,
      recipientTelefono: _datosGuias.recipientTelefono,
      recipientCalle: _datosGuias.recipientCalle,
      recipientCalle2: _datosGuias.recipientCalle2,
      recipientCiudad: _datosGuias.recipientCiudad,
      recipientEstado: _datosGuias.recipientEstado,
      recipientCp: _datosGuias.recipientCp,
      packageLineItemPeso: _datosGuias.packageLineItemPeso,
      packageLineItemLargo: _datosGuias.packageLineItemLargo,
      packageLineItemAncho: _datosGuias.packageLineItemAncho,
      packageLineItemAlto: _datosGuias.packageLineItemAlto,
      packageLineItemContenido: _datosGuias.packageLineItemContenido,
    );

    try {
      var guia = await this._dhlRepository.postGuia(guiaDhl);
      print(guia);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _generaEstafeta() async {
    var guiaEstafeta = new EstafetaPostGuiaRequest(
      guiaTipo: int.parse(_disponibles.tipo),
      guiaPeso: _disponibles.peso,
      guiaRec: "",
      shipperNombre: _datosGuias.shipperNombre,
      shipperCompania: _datosGuias.shipperCompania,
      shipperTelefono: _datosGuias.shipperTelefono,
      shipperCalle: _datosGuias.shipperCalle,
      shipperCalle2: _datosGuias.shipperCalle2,
      shipperCiudad: _datosGuias.shipperCiudad,
      shipperEstado: _datosGuias.shipperEstado,
      shipperCp: _datosGuias.shipperCp,
      recipientNombre: _datosGuias.recipientNombre,
      recipientCompania: _datosGuias.recipientCompania,
      recipientTelefono: _datosGuias.recipientTelefono,
      recipientCalle: _datosGuias.recipientCalle,
      recipientCalle2: _datosGuias.recipientCalle2,
      recipientCiudad: _datosGuias.recipientCiudad,
      recipientEstado: _datosGuias.recipientEstado,
      recipientCp: _datosGuias.recipientCp,
      packageLineItemPeso: _datosGuias.packageLineItemPeso,
      packageLineItemLargo: _datosGuias.packageLineItemLargo,
      packageLineItemAncho: _datosGuias.packageLineItemAncho,
      packageLineItemAlto: _datosGuias.packageLineItemAlto,
      packageLineItemValor: _datosGuias.packageLineItemValor,
      packageLineItemContenido: _datosGuias.packageLineItemContenido,
    );

    try {
      var guia = await this._estafetaRepository.postEstafetaGuia(guiaEstafeta);

      print(guia);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _generaRedpack() async {
    var guiaRedpack = RedpackPostGuiaRequest(
      guiaTipo: int.parse(_disponibles.tipo),
      guiaPeso: _disponibles.peso,
      guiaRec: "",
      shipperNombre: _datosGuias.shipperNombre,
      shipperCompania: _datosGuias.shipperCompania,
      shipperTelefono: _datosGuias.shipperTelefono,
      shipperCalle: _datosGuias.shipperCalle,
      shipperCalle2: _datosGuias.shipperCalle2,
      shipperCiudad: _datosGuias.shipperCiudad,
      shipperEstado: _datosGuias.shipperEstado,
      shipperCp: _datosGuias.shipperCp,
      shipperNumExt: _datosGuias.shipperNumExt,
      recipientNombre: _datosGuias.recipientNombre,
      recipientCompania: _datosGuias.recipientCompania,
      recipientTelefono: _datosGuias.recipientTelefono,
      recipientCalle: _datosGuias.recipientCalle,
      recipientCalle2: _datosGuias.recipientCalle2,
      recipientCiudad: _datosGuias.recipientCiudad,
      recipientEstado: _datosGuias.recipientEstado,
      recipientCp: _datosGuias.recipientCiudad,
      recipientNumExt: _datosGuias.recipientNumExt,
      packageLineItemPeso: _datosGuias.packageLineItemPeso,
      packageLineItemLargo: _datosGuias.packageLineItemLargo,
      packageLineItemAncho: _datosGuias.packageLineItemAncho,
      packageLineItemAlto: _datosGuias.packageLineItemAlto,
      packageLineItemContenido: _datosGuias.packageLineItemContenido,
    );

    try {
      var guia = await this._redpackRepository.postRedpackGuia(guiaRedpack);

      print(guia);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _generaPaquetexp() async {
    var guiaPaquetexp = PaquetexpPostGuiaRequest(
      guiaTipo: int.parse(_disponibles.tipo),
      guiaPeso: _disponibles.peso,
      guiaRec: "",
      shipperNombre: _datosGuias.shipperNombre,
      shipperCompania: _datosGuias.shipperCompania,
      shipperTelefono: _datosGuias.shipperTelefono,
      shipperCalle: _datosGuias.shipperCalle,
      shipperCalle2: _datosGuias.shipperCalle2,
      shipperCiudad: _datosGuias.shipperCiudad,
      shipperEstado: _datosGuias.shipperEstado,
      shipperCp: _datosGuias.shipperCp,
      shipperEmail: _datosGuias.shipperEmail,
      recipientNombre: _datosGuias.recipientNombre,
      recipientCompania: _datosGuias.recipientCompania,
      recipientTelefono: _datosGuias.recipientTelefono,
      recipientCalle: _datosGuias.recipientCalle,
      recipientCalle2: _datosGuias.recipientCalle2,
      recipientCiudad: _datosGuias.recipientCiudad,
      recipientEstado: _datosGuias.recipientEstado,
      recipientCp: _datosGuias.recipientCp,
      recipientEmail: _datosGuias.recipientEmail,
      packageLineItemPeso: _datosGuias.packageLineItemPeso,
      packageLineItemLargo: _datosGuias.packageLineItemLargo,
      packageLineItemAncho: _datosGuias.packageLineItemAncho,
      packageLineItemAlto: _datosGuias.packageLineItemAlto,
      packageLineItemContenido: _datosGuias.packageLineItemContenido,
      packageLineItemValor: _datosGuias.packageLineItemValor,
    );

    try {
      var guia =
          await this._paquetexpRepository.postPaquetexpGuia(guiaPaquetexp);

      print(guia);
    } catch (e) {
      print(e);
    }
  }

//direcciones
  void getDirs(String cp) {
    _coloniasList.clear();
    _ciudadHint = "";
    _estadoHint = "";
    if (this._isFedex) {
      this._getDirFedex(cp).then((value) {
        if (value != null) {
          value.forEach((CpFedex cp) {
            _coloniasList.add(cp.colonia);
          });
          _ciudadHint = value[0].ciudad;
          _estadoHint = value[0].aestado;
          update();
        }
      });
    }
  }

  Future<List<CpFedex>> _getDirFedex(String cp) async {
    if (cp.length < 5) {
      return null;
    }

    try {
      List<CpFedex> resp = await this._fedexRepository.getFedexCp(cp);
      return resp;
    } catch (e) {
      return null;
    }
  }
}
