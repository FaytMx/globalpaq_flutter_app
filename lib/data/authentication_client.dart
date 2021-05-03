import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:globalpaq_app/models/login_response.dart';
import 'package:globalpaq_app/models/session.dart';

class AuthenticationClient {
  final FlutterSecureStorage _secureStorage;

  AuthenticationClient(this._secureStorage);

  Future<String> get accessToken async {
    final data = await _secureStorage.read(key: 'SESSION');

    if (data != null) {
     final Session session = Session.fromJson(jsonDecode(data));

     return session.token;
    }

    return null;
  }

  Future<void> saveSession(LoginResponse loginResponse) async {
    final Session session =
        Session(token: loginResponse.data['token'], createdAt: DateTime.now());

    final data = jsonEncode(session.toJson());

    await _secureStorage.write(key: 'SESSION', value: data);
  }
}
