import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;

import '../services.dart';
import 'error/failures.dart';
import 'interceptor.dart';
import 'isolate_parser.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class ApiService extends get_x.GetxService implements BaseService {
  static ApiService get() => get_x.Get.find<ApiService>();
  late String baseUrl;
  late Dio _dio;


  ApiService(this.baseUrl) {
    baseUrl = baseUrl;
    _dio = _createDio();

    // Add interceptors (logging, authentication, etc.)
    _dio.interceptors.add(DioInterceptor());
  }

  Future<Either<Failure, T>> getRequest<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        required ResponseConverter<T> converter,
        bool isIsolate = true,
      }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }


      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );

      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data));
    }
  }

  Future<Either<Failure, T>> postRequest<T>({
    Map<String, dynamic>? data,
    required ResponseConverter<T> converter,
    bool isIsolate = true,
    required String url,
  }) async {
    try {
      final response = await _dio.post(url, data: data);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException catch (e) {
      return Left(
          ServerFailure(e.response?.data['non_field_errors'].toString()));
    }
  }

  @override
  Future<void> init() async {

  }

  Dio _createDio() => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      validateStatus: (int? status) {
        return status! > 0;
      },
    ),
  );

}
