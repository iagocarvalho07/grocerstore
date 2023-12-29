import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String patch = "PATCH";
  static const String delete = "DELETE";
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    // header da requisição
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'qpDBaiPfuPcTg0EZjeLMXOzjQmZPuAewnHIjq03u',
        'X-Parse-REST-API-Key': 'h65zSswVpSsDDuRiyx7pRKxTO7tFvj6QyUkT3872',
      });
    Dio dio = Dio();
    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
        data: body,
      );
      //retorno do server
      return response.data;
    } on DioException catch (e) {
      // retorno dio request
      return e.response?.data ?? {};
    } catch (e) {
      // retorno erro generico
      return {};
    }
  }
}
