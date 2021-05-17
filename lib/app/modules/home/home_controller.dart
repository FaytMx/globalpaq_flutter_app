import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/requests/fedex/fedex_post_guia_request.dart';
import 'package:globalpaq_app/app/data/models/responses/asociado_info_response.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/asociado_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/dhl_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/estafeta_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/fedex_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/paquetexp_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/redpack_repository.dart';
import 'package:globalpaq_app/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final AsociadoRepository _asociadoRepository = Get.find<AsociadoRepository>();
  final FedexRepository _fedexRepository = Get.find<FedexRepository>();
  final DhlRepository _dhlRepository = Get.find<DhlRepository>();
  final EstafetaRepository _estafetaRepository = Get.find<EstafetaRepository>();
  final RedpackRepository _redpackRepository = Get.find<RedpackRepository>();
  final PaquetexpRepository _paquetexpRepository =
      Get.find<PaquetexpRepository>();

  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  DataAsociado _asociado = new DataAsociado();
  DataAsociado get asociado => _asociado;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  Future<void> _init() async {
    try {
      var response = await _asociadoRepository.getAsociadoInfo();
      await Future.delayed(Duration(seconds: 5));
      _asociado = response.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() {
    _localAuthRepository.clearSession();
    Get.offAllNamed(AppRoutes.SPLASH);
  }

  Future<void> _fedexTest() async {
    try {
      // var guia = new FedexPostGuiaRequest(
      //   guiaTipo: 17,
      //   guiaPeso: 15,
      //   guiaRec: "no",
      //   shipperNombre: "Globalpaq",
      //   shipperCompania: "Globalpaq",
      //   shipperTelefono: "5521688202",
      //   shipperCalle: "Av. Fraccionamiento ",
      //   shipperCalle2: "And. 20 Lt 9 Mzn. 3",
      //   shipperCiudad: "Nicolas romero",
      //   shipperEstado: "MEX",
      //   shipperCp: "54743",
      //   recipientNombre: "Elizabeth",
      //   recipientCompania: "Seven",
      //   recipientTelefono: "5558234219",
      //   recipientCalle: "Calle 22 de mayo",
      //   recipientCalle2: "esquina con circular",
      //   recipientCiudad: "Nicolas Romero",
      //   recipientEstado: "MEX",
      //   recipientCp: "54400",
      //   packageLineItemPeso: 1,
      //   packageLineItemLargo: 10,
      //   packageLineItemAncho: 10,
      //   packageLineItemAlto: 10,
      // );
      // var datos = await _fedexRepository.postFedexGuia(guia);
      // print(datos);

    } catch (e) {
      print(e);
    }
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openDrawer();
    }
  }
}
