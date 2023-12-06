import 'package:bookly/core/errors/error_model.dart';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch(dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout With Api Server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout With Api Server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Timeout With Api Server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Connection Timeout With Api Server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(statusCode: dioException.response?.statusCode, response: dioException.response);
      case DioExceptionType.cancel:
        return ServerFailure("Request was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection error, Please check your internet connection");
      case DioExceptionType.unknown:
        return ServerFailure('Opps there was an error, Please try later!');
    }
  }

  factory ServerFailure.fromResponse({required int? statusCode, required response }) {
    if(statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure('${response['error']['message']}');
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, Please try later!");
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later!');
    } else {
      return ServerFailure('Opps there was an error, Please try later!');
    }
  }
}