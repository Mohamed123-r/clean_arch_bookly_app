// import 'package:bookly/core/error/exceptions.dart';
// import 'package:dio/dio.dart';
// import 'api_consumer.dart';
// import 'api_interceptor.dart';
// import 'end_point.dart';
//
// class DioConsumer extends ApiConsumer {
//   final Dio dio;
//
//   DioConsumer({required this.dio}) {
//     dio.options.baseUrl = EndPoint.baseUrl;
//     dio.interceptors.add(ApiInterceptor());
//     dio.interceptors.add(
//       LogInterceptor(
//         error: true,
//         requestBody: true,
//         responseBody: true,
//         requestHeader: true,
//         responseHeader: true,
//       ),
//     );
//   }
//
//   @override
//   Future<dynamic> get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       var response = await dio.get(
//         path,
//         queryParameters: queryParameters,
//       );
//
//       return response.data;
//     } on DioException catch (e) {
//       ServerFailure(e.toString());
//     }
//   }
//
//   @override
//   Future<dynamic> delete(
//     String path, {
//     Map<String, dynamic>? body,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.delete(
//         path,
//         data: isFormData ? FormData.fromMap(body!) : body,
//       );
//       return response.data;
//     } on DioException catch (e) {
//       ServerFailure(e.toString());
//     }
//   }
//
//   @override
//   Future<dynamic> patch(
//     String path, {
//     Map<String, dynamic>? body,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.patch(
//         path,
//         data: isFormData ? FormData.fromMap(body!) : body,
//       );
//       return response.data;
//     } on DioException catch (e) {
//       ServerFailure(e.toString());
//     }
//   }
//
//   @override
//   Future<dynamic> post(
//     String path, {
//     Map<String, dynamic>? body,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.post(
//         path,
//         data: isFormData ? FormData.fromMap(body!) : body,
//       );
//       return response.data;
//     } on DioException catch (e) {
//       ServerFailure(e.toString());
//     }
//   }
//
//   @override
//   Future<dynamic> put(
//     String path, {
//     Map<String, dynamic>? body,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.put(
//         path,
//         data: isFormData ? FormData.fromMap(body!) : body,
//       );
//       return response.data;
//     } on DioException catch (e) {
//       ServerFailure(e.toString());
//     }
//   }
// }
