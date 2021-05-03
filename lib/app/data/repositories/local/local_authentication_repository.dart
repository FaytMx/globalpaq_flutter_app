import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/providers/local/local_auth.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(requestToken) => _localAuth.setSession(requestToken);

  Future get session => _localAuth.getSession();

  Future<void> clearSession() => _localAuth.clearSession();
}
