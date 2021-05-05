import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/providers/local/local_auth.dart';
import 'package:globalpaq_app/app/data/providers/remote/asociado_api.dart';
import 'package:globalpaq_app/app/data/providers/remote/login_api.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/asociado_repository.dart';
import 'package:globalpaq_app/app/data/repositories/remote/login_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(),
        fenix: true);

    Get.lazyPut<Dio>(
        () => Dio(BaseOptions(
            baseUrl: "https://sistema.globalpaq.mx/api/v0/public")),
        fenix: true);


    // Providers
    Get.lazyPut<LocalAuth>(() => LocalAuth(), fenix: true);
    Get.lazyPut(() => LoginAPI(),fenix: true);
    Get.lazyPut(() => AsociadoAPI(), fenix: true);
    //Repositories
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(), fenix: true);
    Get.lazyPut(() => LoginRepository(), fenix: true);
    Get.lazyPut(() => AsociadoRepository(), fenix: true);
  }
}
