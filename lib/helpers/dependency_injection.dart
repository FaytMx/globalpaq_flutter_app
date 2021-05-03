import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:globalpaq_app/api/authentication_api.dart';
import 'package:globalpaq_app/data/authentication_client.dart';
import 'package:globalpaq_app/helpers/http.dart';
import 'package:logger/logger.dart';

abstract class DependencyInjection {
  static void initialize() {
    final Dio dio =
        Dio(BaseOptions(baseUrl: 'https://sistema.globalpaq.mx/api/v0/public'));
    Logger logger = Logger();

    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    Http http = Http(dio: dio, logger: logger, logsEnabled: true);

    final AuthenticationAPI authenticationAPI = AuthenticationAPI(http);
    final AuthenticationClient authenticationClient =
        AuthenticationClient(secureStorage);

    GetIt.instance.registerSingleton<AuthenticationAPI>(authenticationAPI);
    GetIt.instance
        .registerSingleton<AuthenticationClient>(authenticationClient);
  }
}
