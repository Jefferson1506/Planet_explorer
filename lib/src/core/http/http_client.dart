import 'package:dio/dio.dart';

class HttpClientDio {
  late final Dio _dio;

  HttpClientDio() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://us-central1-a-academia-espacial.cloudfunctions.net',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      responseType: ResponseType.json,
      headers: {
        'Content-Type': 'Application/json',
        'Accept': 'Application/json',
      },
    );
    _dio = Dio(options);
  }
  static final HttpClientDio _httpClient = HttpClientDio();
  static Dio get httpClient => _httpClient._dio;
}
