
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

  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

  Future<ApiResult<List<Employee>>> fetchPhotosList() async {
    try {
      print("req");
      final response = await dioClient
          .get("/employees");
      // var data = json.decode(response);
      // print('income' + data);
      // Map<String, dynamic> map = json.decode(response);
      // List<String> data = map["data"];
      // print('test' + map.toString());
      // List responseJson = json.decode(response.toString());
      // List<Employee> newsTitle = createNewsList(responseJson);
      List<Employee> photoList = parsePhotos(response);
      // List<Employee> HAHA = new List<Employee>.from(json.decode(response)['data']);

      // final restaurants = response['data']
      //     .map<Employee>((json) => Employee.fromJson(json['data']))
      //     .toList(growable: false);

      // photoList.add(response);

      return ApiResult.success(data: photoList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  List<Employee> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }
  List<Employee> createNewsList(List data) {
    List<Employee> list = new List();
    for (int i = 0; i< data.length; i++) {
      Employee emp = data[i]['data'];
      list.add(emp);
      new Employee();
    }
    return list;
}

}
