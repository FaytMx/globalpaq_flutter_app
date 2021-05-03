import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/providers/local/local_auth.dart';
import 'package:globalpaq_app/app/data/repositories/local/local_authentication_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(),
        fenix: true);

    Get.lazyPut<Dio>(
        () => Dio(BaseOptions(
            baseUrl: "https://sistema.globalpaq.mx/api/v0/public/")),
        fenix: true);

    // Providers
    Get.lazyPut<LocalAuth>(() => LocalAuth(), fenix: true);
    //Repositories
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(), fenix: true);
  }
}
