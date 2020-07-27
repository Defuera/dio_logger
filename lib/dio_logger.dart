library dio_logging;

import 'package:dio/dio.dart';

export 'src/exposed.dart';

final DioLoggerInterceptor = InterceptorsWrapper(onRequest: (RequestOptions options) async {
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "| $key: $value\n";
  });

  print("┌------------------------------------------------------------------------------");
  print('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
  print("├------------------------------------------------------------------------------");
  return options; //continue
}, onResponse: (Response response) async {
  print("| [DIO] Response: ${response.data.toString()}");
  print("└------------------------------------------------------------------------------");
  return response; // continue
}, onError: (DioError e) async {
  print("| [DIO] Error: ${e.toString()}");
  print("└------------------------------------------------------------------------------");
  return e; //continue
});
