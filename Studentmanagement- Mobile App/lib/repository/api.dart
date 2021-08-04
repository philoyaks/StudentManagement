import 'package:dio/dio.dart';
import 'package:studentmanagement_app/models/classes.dart';
import 'package:studentmanagement_app/models/students.dart';

class Api {
  /// I made use of Dio package to consume the Api Made by me
  var dio = new Dio();
  var baseURl = "https://student-managements.herokuapp.com";

  static const studentbaseUrl = "Management/students";

  static const classbaseUrl = "Management/class";

  static const orderBaseUrl = "Management/order";

  static const searchBaseURl = "Management/search";

  Future<List<Classes>> getClasses() async {
    Response response;

    response = await dio.get('$baseURl/$classbaseUrl',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));

    if (response.statusCode == 200) {
      List<Classes> result = response.data
          .map<Classes>((value) => Classes.fromJson(value))
          .toList();
      return result;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<List<Students>> getStudents() async {
    Response response;
    response = await Dio().get('$baseURl/$studentbaseUrl');
    if (response.statusCode == 200) {
      List<Students> result = response.data
          .map<Students>((value) => Students.fromJson(value))
          .toList();

      return result;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  getStudentsByOrder(String param) async {
    Response response;

    if (param == "Asc") {
      response = await dio.get('$baseURl/Management/order/$param');
      if (response.statusCode == 200) {
        return response.data
            .map<Students>((value) => Students.fromJson(value))
            .toList();
      } else {
        throw Exception('Failed to load Data');
      }
    }
    if (param == "Dsc") {
      response = await dio.get('$baseURl/Management/order/$param');
      if (response.statusCode == 200) {
        return response.data
            .map<Students>((value) => Students.fromJson(value))
            .toList();
      } else {
        throw Exception('Failed to load Data');
      }
    }
  }

  Future<List<Students>> getSearchedStudents(String param) async {
    Response response;

    response = await dio.delete('$baseURl/$classbaseUrl',
        queryParameters: {"searchName": param});

    if (response.statusCode == 200) {
      return response.data.map((value) => Students.fromJson(value)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  postStudentDetails(Students students) async {
    Response response;

    response =
        await dio.post('$baseURl/$studentbaseUrl', data: students.toJson());
    if (response.statusCode == 204) {
      return "success";
    } else {
      throw Exception('Failed to load Data');
    }
  }

  editStudentDetails(Students students) async {
    Response response;

    response = await dio.post('$baseURl/$studentbaseUrl/Edit',
        data: students.toJson());
    if (response.statusCode == 204) {
      return "success";
    } else {
      throw Exception('Failed to load Data');
    }
  }

  postClassDetails(Classes classes) async {
    Response response;
    print(classes.toJson());
    response = await dio.post(
      '$baseURl/$classbaseUrl',
      data: classes.toJson(),
    );
    if (response.statusCode == 204) {
      return "success";
    } else {
      throw Exception('Failed to load Data');
    }
  }

  deleteClasses(String classname) async {
    Response response;

    response = await dio.delete('$baseURl/Management/class/$classname');

    if (response.statusCode == 204) {
      return "success";
    } else {
      return 'failed';
    }
  }

  deleteStudentDetail(String? id) async {
    Response response;

    response = await dio.delete('$baseURl/Management/student/$id');

    if (response.statusCode == 204) {
      return "success";
    } else {
      return "failed";
    }
  }
}
