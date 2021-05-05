import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LocalAuth {
  static const KEY = "session";

  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(String requestToken) async {
    await _storage.write(key: KEY, value: jsonEncode(requestToken));
  }

  Future<String> getSession() async {
    final String data = await _storage.read(key: KEY);
    if (data != null) {
      final requestToken = jsonDecode(data);

      final DateTime expiresAt = JwtDecoder.getExpirationDate(requestToken);

      if (DateTime.now().isBefore(expiresAt)) {
        return requestToken;
      }
      this.clearSession();
      return null;
    }

    return null;
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }
}
