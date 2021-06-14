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

class CoberturaController extends GetxController {
  //servicios
  final FedexRepository _fedexRepository = Get.find<FedexRepository>();
  final DhlRepository _dhlRepository = Get.find<DhlRepository>();
  final EstafetaRepository _estafetaRepository = Get.find<EstafetaRepository>();
  final RedpackRepository _redpackRepository = Get.find<RedpackRepository>();
  final PaquetexpRepository _paquetexpRepository =
      Get.find<PaquetexpRepository>();
  //datos
  var _coberturaFedex = [];
  var _coberturaDhl = [];
  var _coberturaEstafeta = [];
  var _coberturaRedpack = [];
  var _coberturPaquetexp = [];

  get coberturaFedex => _coberturaFedex;
  get coberturaDhl => _coberturaDhl;
  get coberturaEstafeta => _coberturaEstafeta;
  get coberturaRedpack => _coberturaRedpack;
  get coberturaPaquetexp => _coberturPaquetexp;

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
      getCoberturas(_cpOrigen, _cpDestino);
    }
  }

  Future<void> getCoberturas(cpOrigen, cpDestino) async {
    FedexCoberturaResponse resFedex =
        await this._fedexRepository.getFedexCobertura(cpOrigen, cpDestino);
    DhlCoberturaResponse resDhl =
        await this._dhlRepository.getCobertura(cpOrigen, cpDestino);
    EstafetaCoberturaResponse resEstafeta = await this
        ._estafetaRepository
        .getEstafetapCobertura(cpOrigen, cpDestino);
    RedpackCoberturaResponse resRedpack =
        await this._redpackRepository.getRedpackCobertura(cpOrigen, cpDestino);
    PaquetexpCoberturaResponse resPaquetexp = await this
        ._paquetexpRepository
        .getPaquetexpCobertura(cpOrigen, cpDestino);

    print(resPaquetexp);
  }
}
