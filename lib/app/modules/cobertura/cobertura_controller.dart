import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/dhl/dhl_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/estafeta/estafeta_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/fedex/fedex_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/paquetexp/paquetexp_cobertura_response.dart';
import 'package:globalpaq_app/app/data/models/responses/redpack/redpack_cobertura_response.dart';
import 'package:globalpaq_app/app/data/repositories/remote/dhl_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/estafeta_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/fedex_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/paquetexp_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/redpack_repository.dart';

class CoberturaPaqueterias {
  String cobertura;
  String ocurre;
  List<dynamic> servicios;
  CoberturaPaqueterias({this.cobertura, this.servicios, this.ocurre});
}

class CoberturaController extends GetxController {
  //servicios
  final FedexRepository _fedexRepository = Get.find<FedexRepository>();
  final DhlRepository _dhlRepository = Get.find<DhlRepository>();
  final EstafetaRepository _estafetaRepository = Get.find<EstafetaRepository>();
  final RedpackRepository _redpackRepository = Get.find<RedpackRepository>();
  final PaquetexpRepository _paquetexpRepository =
      Get.find<PaquetexpRepository>();
  //datos
  CoberturaPaqueterias _coberturaFedex;
  CoberturaPaqueterias _coberturaDhl;
  CoberturaPaqueterias _coberturaEstafeta;
  CoberturaPaqueterias _coberturaRedpack;
  CoberturaPaqueterias _coberturPaquetexp;

  CoberturaPaqueterias get coberturaFedex => _coberturaFedex;
  CoberturaPaqueterias get coberturaDhl => _coberturaDhl;
  CoberturaPaqueterias get coberturaEstafeta => _coberturaEstafeta;
  CoberturaPaqueterias get coberturaRedpack => _coberturaRedpack;
  CoberturaPaqueterias get coberturaPaquetexp => _coberturPaquetexp;

  String _cpOrigen;
  String _cpDestino;
  String get cpOrigen => _cpOrigen;
  String get cpDestino => _cpDestino;

  void cpOrigenSet(String value) {
    if (value.length > 4 && value.length < 6) {
      if (int.tryParse(value) != null) {
        _cpOrigen = value;
      }
    }
  }

  void cpDestinoSet(String value) {
    if (value.length > 4 && value.length < 6) {
      if (int.tryParse(value) != null) {
        _cpDestino = value;
      }
    }
  }

  //metodos
  void buscaCobertura() {
    if (_cpOrigen != null && _cpDestino != null) {
      getCoberturas(_cpOrigen, _cpDestino).then((value) => update());
    }
  }

  Future<void> getCoberturas(cpOrigen, cpDestino) async {
    try {
      FedexCoberturaResponse resFedex =
          await this._fedexRepository.getFedexCobertura(cpOrigen, cpDestino);
      _coberturaFedex = new CoberturaPaqueterias(
          cobertura: resFedex.data.message, servicios: resFedex.data.services);
    } catch (e) {
      _coberturaFedex = new CoberturaPaqueterias(
        cobertura: e.message,
        servicios: [],
      );
    }

    try {
      DhlCoberturaResponse resDhl =
          await this._dhlRepository.getCobertura(cpOrigen, cpDestino);
      print(resDhl);
      _coberturaDhl = new CoberturaPaqueterias(
        cobertura: resDhl.data.message,
        servicios: [],
      );
    } catch (e) {
      print(e);
    }

    try {
      EstafetaCoberturaResponse resEstafeta = await this
          ._estafetaRepository
          .getEstafetapCobertura(cpOrigen, cpDestino);
      print(resEstafeta);
      _coberturaEstafeta = new CoberturaPaqueterias(
        cobertura: resEstafeta.data.message,
        ocurre: resEstafeta.data.ocurre,
        servicios: [],
      );
    } catch (e) {
      _coberturaEstafeta = new CoberturaPaqueterias(
        cobertura: 'Sin Cobertura',
        ocurre: "No",
        servicios: [],
      );
      print(e);
    }

    try {
      List<RedpackCobertura> resRedpack = await this
          ._redpackRepository
          .getRedpackCobertura(cpOrigen, cpDestino);

      if (resRedpack[0]
          .descripcion
          .contains("NO SE TIENE COBERTURA PARA ESTE ENVÍO")) {
        _coberturaRedpack = new CoberturaPaqueterias(
          cobertura: resRedpack[0].descripcion,
          servicios: [],
        );
      } else {
        List<String> servicios = (resRedpack).map((e) => e.servicio).toList();

        List<String> servs = [];
        servicios.forEach((e) {
          if (servs.contains(e)) {
            print("duplicado: $e");
          } else {
            servs.add(e);
          }
        });

        _coberturaRedpack = new CoberturaPaqueterias(
          cobertura: resRedpack[0].descripcion,
          servicios: servs,
        );
      }
    } catch (e) {
      print(e);
    }

    try {
      PaquetexpCoberturaResponse resPaquetexp = await this
          ._paquetexpRepository
          .getPaquetexpCobertura(cpOrigen, cpDestino);
      print(resPaquetexp);

      var paqExp = resPaquetexp.data;
      _coberturPaquetexp =
          new CoberturaPaqueterias(cobertura: paqExp.message, servicios: []);
    } catch (e) {
      print(e);
    }
  }
}
