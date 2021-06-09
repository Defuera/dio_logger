library dio_logger;

import 'package:dio/dio.dart';

final dioLoggerInterceptor = InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "| $key: $value";
  });

  print("┌------------------------------------------------------------------------------");
  print('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
  print("├------------------------------------------------------------------------------");
  handler.next(options);  //continue
}, onResponse: (Response response, handler) async {
  print("| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
  print("└------------------------------------------------------------------------------");
  handler.next(response);
  // return response; // continue
}, onError: (DioError error, handler) async {
  print("| [DIO] Error: ${error.error}: ${error.message}");
  print("└------------------------------------------------------------------------------");
  handler.next(error); //continue
});
