import 'dart:async';
import 'dart:developer';

import 'package:interceptors/data/endpoints/endpoints.dart';
import 'package:interceptors/data/network/dio_client.dart';
import 'package:interceptors/services/locator.dart';

class AuthRepository {
  final netWorkLocator = getIt.get<DioClient>();

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? userName,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await netWorkLocator.dio
          .post('${EndPoints.baseUrl}${EndPoints.register}', data: {
        'email': email,
        'password': password,
        'username': userName,
      });
      if (response.statusCode != 200) {
        throw Exception('Failed to sign up');
      }
      completer.complete(response.data);
    } catch (e) {
      print(e);
    }
    return completer.future;
  }

  Future<Map<String, dynamic>> logIn({
    required String email,
    required String password,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await netWorkLocator.dio.post(
        '${EndPoints.baseUrl}${EndPoints.login}',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to sign in');
      }

      completer.complete(response.data);
    } catch (e) {
      log('$netWorkLocator');
    }
    return completer.future;
  }
}
