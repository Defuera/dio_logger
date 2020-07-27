# dio_logger

Simple logging interceptor for [Dio](https://pub.dev/packages/dio).

## Usage:

```
final dio = Dio();
dio.interceptors.add(DioLoggerInterceptor)
```

## Sample output:

```
┌------------------------------------------------------------------------------
| [DIO] Request: GET https://myapi.com/users/3
| {}
| Headers:
| content-type: application/json; charset=utf-8
| accept: application/json; charset=utf-8
| cache-control: no-cache
| Access-Token: DJmdklfja3r3Ffmejwhfdgjh
├------------------------------------------------------------------------------
| [DIO] Response: {"email":"justdevelopers@gmail.com","name":"defuera"}
└------------------------------------------------------------------------------
```

## Features

- Log request method
- Log query paramethers
- Log request body
- Log response code
- Log response body
