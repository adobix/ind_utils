String apiChecker(){
  return '''import 'dart:developer';
import 'api_response.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    if (apiResponse.error == "Failed to load data - status code: 401") {
      // Provider.of<AuthController>(Get.context!,listen: false).clearSharedData();
    } else if (apiResponse.response?.statusCode == 500) {
      //toast message here --internal_server_error
    } else {
      String? errorMessage = apiResponse.error.toString();
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = ErrorResponse.fromJson(apiResponse.error);
        log(errorResponse.toString());
      }
      //toast message here --errorMessage
    }
  }
}

class ErrorResponse {
  List<Errors>? errors;

  ErrorResponse({this.errors});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }
}

class Errors {
  String? code;
  String? message;

  Errors({this.code, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }
}
''';
}

String genApiError(){
  return '''
import 'package:dio/dio.dart';

import 'api_checker.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 403:
                  if(error.response!.data['errors'] != null){
                    ErrorResponse errorResponse = ErrorResponse.fromJson(error.response?.data);
                   errorDescription = errorResponse.errors?[0].message;
                  }else{
                    errorDescription = error.response!.data['message'];
                  }
                  break;
                case 401:
                  if(error.response!.data['errors'] != null){
                    ErrorResponse errorResponse = ErrorResponse.fromJson(error.response?.data);
                    errorDescription = errorResponse.errors?[0].message;
                  } else{
                    errorDescription = error.response!.data['message'];
                  }
                  // Provider.of<AuthController>(Get.context!,listen: false).clearSharedData();
                  break;
                case 500:
                  errorDescription = 'Internal server error';
                case 503:
                case 429:
                  errorDescription = error.response!.statusMessage;
                  break;
                default:
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {errorDescription = "Failed to load data - status code: \${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.badCertificate:
              // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
              // TODO: Handle this case.
              break;
            case DioExceptionType.unknown:
              errorDescription = "Request to API call limit excited ";
              break;
          }
        } else {
          // print("error.response!.statusCode \${error.response!.statusCode}");
          // Response res = (error) as Response;
          errorDescription = "Unexpected error occured ";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
''';
}

String getApiCalling(){
  return '''import 'dart:io';
import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio();

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
''';
}

String getApiLog(){
  return '''import 'package:dio/dio.dart';
import 'package:ind_utils/src/utils/log_print.dart';

class ApiLog extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    /// if you need then print more here about your response
    var method = response.requestOptions.method;
    var code = response.statusCode;
    var url = response.requestOptions.uri;
    printLog("STATUS CODE \$code : ", "Method \$method , Link : \$url").success ;

    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
      }
    }
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    /// if you need then print more here about your response
    printLog("STATUS CODE \${err.response?.statusCode} : ", "\${err.requestOptions.uri}").success;
    return super.onError(err, handler);
  }
}
''';
}
String getApiRes(){
  return '''  import 'package:dio/dio.dart';

  class ApiResponse {
    final Response? response;
    final dynamic error;

    ApiResponse(this.response, this.error);

    ApiResponse.withError(dynamic errorValue)
        : response = null,
          error = errorValue;

    ApiResponse.withSuccess(Response responseValue)
        : response = responseValue,
          error = null;
  }
''';
}