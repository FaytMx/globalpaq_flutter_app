import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/providers/local/local_auth.dart';
import 'package:globalpaq_app/app/data/providers/remote/asociado_api.dart';
import 'package:globalpaq_app/app/data/providers/remote/dhl_api.dart';
import 'package:globalpaq_app/app/data/providers/remote/estafeta_api.dart';
import 'package:globalpaq_app/app/data/providers/remote/fedex_api.dart';
import 'package:globalpaq_app/app/data/providers/remote/login_api.dart';
import 'package:globalpaq_app/app/data/providers/remote/paquete_express_api.dart';
import 'package:globalpaq_app/app/data/providers/remote/redpack_api.dart';
import 'package:globalpaq_app/app/data/providers/remote/tienda_api.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/asociado_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/dhl_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/estafeta_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/fedex_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/login_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/paquetexp_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/redpack_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/tienda_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(),
        fenix: true);

    Get.lazyPut<Dio>(
        () => Dio(
            BaseOptions(baseUrl: "https://sistema.globalpaq.mx/api/v0/public")),
        fenix: true);

    // Providers
    Get.lazyPut<LocalAuth>(() => LocalAuth(), fenix: true);
    Get.lazyPut(() => LoginAPI(), fenix: true);
    Get.lazyPut(() => AsociadoAPI(), fenix: true);
    Get.lazyPut(() => FedexAPI(), fenix: true);
    Get.lazyPut(() => DhlAPI(), fenix: true);
    Get.lazyPut(() => EstafetaAPI(), fenix: true);
    Get.lazyPut(() => RedpackAPI(), fenix: true);
    Get.lazyPut(() => PaqueteExpressAPI(), fenix: true);
    Get.lazyPut(() => TiendaAPI(), fenix: true);

    //Repositories
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(), fenix: true);
    Get.lazyPut(() => LoginRepository(), fenix: true);
    Get.lazyPut(() => AsociadoRepository(), fenix: true);
    Get.lazyPut(() => FedexRepository(), fenix: true);
    Get.lazyPut(() => DhlRepository(), fenix: true);
    Get.lazyPut(() => EstafetaRepository(), fenix: true);
    Get.lazyPut(() => RedpackRepository(), fenix: true);
    Get.lazyPut(() => PaquetexpRepository(), fenix: true);
    Get.lazyPut(() => TiendaRepository(), fenix: true);
  }
}
