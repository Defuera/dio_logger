library dio_logger;

import 'package:dio/dio.dart';

final dioLoggerInterceptor = InterceptorsWrapper(onRequest: (RequestOptions options) async {
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "| $key: $value";
  });

  print("┌------------------------------------------------------------------------------");
  print('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
  print("├------------------------------------------------------------------------------");
  return options; //continue
}, onResponse: (Response response) async {
  print("| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
  print("└------------------------------------------------------------------------------");
  return response; // continue
}, onError: (DioError e) async {
  print("| [DIO] Error: ${e.toString()}");
  print("└------------------------------------------------------------------------------");
  return e; //continue
});
