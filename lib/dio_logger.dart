library dio_logging;

import 'package:dio/dio.dart';

export 'src/exposed.dart';

final DioLoggerInterceptor = InterceptorsWrapper(onRequest: (RequestOptions options) async {
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "$key: $value\n";
  });

  print("[DIO] Request: ${options.method} ${options.uri}\n$headers");
  return options; //continue
}, onResponse: (Response response) async {
  print("[DIO] Response: ${response.data.toString()}");
  return response; // continue
}, onError: (DioError e) async {
  print("[DIO] Error: ${e.toString()}");
  return e; //continue
});
