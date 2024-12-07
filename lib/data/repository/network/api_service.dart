import 'package:aneukan/data/models/homecam.dart';
import 'package:aneukan/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'endpoints.dart';

class ApiService {
  final String baseUrl = dotenv.env['API_BASE_URL'] ?? '';

  Future<T> _get<T>(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }

  Future<int> login(String id, String password) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/${Endpoint.getLogin.path}?id=$id&password=$password'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return int.parse(response.body);
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }

  Future<int> register(
      String id, String password, String name, String phone) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/${Endpoint.postRegister.path}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'identifier': id,
          'password': password,
          'name': name,
          'phone_num': phone
        }),
        encoding: Encoding.getByName('utf-8'),
      );

      if (response.statusCode == 200) {
        return int.parse(response.body);
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }

  Future<User> getUserInfo() async {
    return _get<User>(Endpoint.getUserInfo.path);
  }

  Future<List<Homecam>> getHomecamList() async {
    return _get<List<Homecam>>(Endpoint.getHomecamList.path);
  }

  Future<Homecam> getHomecamDetail(int homecamId) async {
    final url = '${Endpoint.getHomecamDetail.path}/$homecamId';
    return _get<Homecam>(url);
  }

  Future<void> postHomecamAccessPermissionRequest(String serialNumber) async {
    try {
      final response = await http.post(
        Uri.parse(
            '$baseUrl/${Endpoint.postHomecamAccessPermissionRequest.path}?serialnum=$serialNumber'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }
}
