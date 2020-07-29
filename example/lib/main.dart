import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

void main() async {
  await Dio()
    ..interceptors.add(dioLoggerInterceptor)
    ..get("http://dummy.restapiexample.com/api/v1/employee/1"); //this prints to console
}
