import 'package:cp_delivery/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpResult {
  final String token;

  SingUpResult(this.token);

  SingUpResult.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String;
}

class AuthApiBinder {
  final _apiService = Get.find<ApiService>();

  Future<SingUpResult> singUp({
    @required String email,
    @required String password,
  }) async {
    var result = await _apiService.send(
      '/v1/auth/singUp',
      RequestType.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    return SingUpResult.fromJson(result);
  }

  Future singIn({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
  }) async {
    await _apiService.send(
      '/v1/auth/singIn',
      RequestType.post,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    );
  }
}
