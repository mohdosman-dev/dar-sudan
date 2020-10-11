import 'dart:ffi';

import 'package:dar_sudan/models/empl.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'DioClient.dart';
import 'api_result.dart';
import 'network_exceptions.dart';

class APIRepository {
  DioClient dioClient;
  String _baseUrl = "http://dummy.restapiexample.com/api/v1";

  // String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

  Future<ApiResult<List<Employee>>> fetchPhotosList() async {
    try {

      final response = await dioClient.get("/employees");
      List<Employee> photoList = parseUser(response['data']);

      return ApiResult.success(data: photoList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  List<Employee> parseUser(List responseBody) {
    print('func >> ' + responseBody.toString());
    return responseBody.map((user) => Employee.fromJson(user)).toList();
  }

}
