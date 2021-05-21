import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_disponibles_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_disponibles_response.dart';
import 'package:globalpaq_app/app/data/repositories/remote/dhl_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/estafeta_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/fedex_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/paquetexp_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/redpack_repository.dart';

class MisGuiasController extends GetxController {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final FedexRepository _fedexRepository = Get.find<FedexRepository>();
  final DhlRepository _dhlRepository = Get.find<DhlRepository>();
  final EstafetaRepository _estafetaRepository = Get.find<EstafetaRepository>();
  final RedpackRepository _redpackRepository = Get.find<RedpackRepository>();
  final PaquetexpRepository _paquetexpRepository =
      Get.find<PaquetexpRepository>();

  var _disponibles = [];
  String _paqueteriaSel = "";

  final List<String> _paqueterias = [
    "Fedex",
    "DHL",
    "Estafeta",
    "Redpack",
    "Paquetexpress",
  ];

  List<String> get paqueterias => _paqueterias;

  get disponibles => _disponibles;
  get paqueteriaSel => _paqueteriaSel;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void onInit() {
    super.onInit();
    getDisp(Get.arguments);
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openDrawer();
    }
  }

  void getDisp(String paqueteria) {
    this.getDisponiblesPaqueteria(paqueteria).then((value) {
      _disponibles = value;
      update();
    });
  }

  Future<List<dynamic>> getDisponiblesPaqueteria(String paqueteria) async {
    print(paqueteria);

    if (paqueteria == "Fedex") {
      List<FedexDisponiblesResponse> disponibles =
          await _fedexRepository.getFedexDisponibles();

      return disponibles;
    } else if (paqueteria == "DHL") {
      List<DhlDisponiblesResponse> disponibles =
          await _dhlRepository.getDisponibles();

      return disponibles;
    } else if (paqueteria == "Estafeta") {
      List<EstafetaDisponiblesResponse> disponibles =
          await _estafetaRepository.getEstafetaDisponibles();

      return disponibles;
    } else if (paqueteria == "Redpack") {
      List<RedpackDisponiblesResponse> disponibles =
          await _redpackRepository.getRedpackDisponibles();

      return disponibles;
    } else if (paqueteria == "Paquetexpress") {
      List<PaquetexpDisponiblesResponse> disponibles =
          await _paquetexpRepository.getPaquetexpDisponibles();

      return disponibles;
    } else {
      List<dynamic> disponibles = [];

      return disponibles;
    }
  }
}
