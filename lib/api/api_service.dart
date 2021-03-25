import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;

class ApiErrorData {
  final int code;
  final String type;
  final String message;

  ApiErrorData({
    @required this.code,
    @required this.type,
    @required this.message,
  });
}

class ApiException implements Exception {}

class CantFindErrorHandlerException implements ApiException {}

class CantProcessException implements ApiException {}

enum RequestType {
  get,
  post,
  delete,
}

typedef ApiErrorHandlerCallback = void Function(ApiErrorData);

class ApiService extends getx.GetxService {
  String _address;
  Dio _client;
  final _errorsList = <String, ApiErrorHandlerCallback>{};

  void addErrorHandler(
    String errorTypeName,
    ApiErrorHandlerCallback handler,
  ) {
    if (!_errorsList.containsKey(errorTypeName)) {
      _errorsList[errorTypeName] = handler;
    }
  }

  void init(String address) {
    _address = address;
    _client = Dio();
  }

  Future<Map<String, dynamic>> send(
    String path,
    RequestType type, {
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    Map<String, dynamic> body,
  }) async {
    var result = await _sendResponse(
      type,
      query: query,
      path: path,
      headers: headers,
      body: body,
    );

    if (result.statusCode >= 200 && result.statusCode < 300) {
      return result.data as Map<String, dynamic>;
    } else {
      Map<String, dynamic> data = result.data as Map<String, dynamic>;

      if (!data.containsKey('errorType')) {
        throw CantProcessException();
      }

      ApiErrorData errorData = ApiErrorData(
        code: data['code'] as int,
        type: data['errorType'] as String,
        message: data['errorMessage'] as String,
      );

      if (_errorsList.containsKey(errorData.type)) {
        _errorsList[errorData.type](errorData);
        return null;
      } else {
        throw CantFindErrorHandlerException();
      }
    }
  }

  Future<Response> _sendResponse(
    RequestType type, {
    String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    Map<String, dynamic> body,
  }) async {
    Response response;

    try {
      if (type == RequestType.get) {
        response = await _client.get<Map<String, dynamic>>(
          _address + path,
          queryParameters: query,
          options: Options(
            headers: headers,
          ),
        );
      } else if (type == RequestType.post) {
        response = await _client.post<Map<String, dynamic>>(
          _address + path,
          queryParameters: query,
          options: Options(
            headers: headers,
          ),
          data: body,
        );
      } else if (type == RequestType.delete) {
        response = await _client.delete<Map<String, dynamic>>(
          _address + path,
          queryParameters: query,
          options: Options(
            headers: headers,
          ),
          data: body,
        );
      }
    } on DioError catch (e) {
      response = e.response;
    }

    return response;
  }
}
