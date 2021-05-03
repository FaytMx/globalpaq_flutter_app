import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

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

      return requestToken;
    }

    return null;
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }
}
