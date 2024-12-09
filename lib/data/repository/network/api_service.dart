import 'package:aneukan/data/models/access_info.dart';
import 'package:aneukan/data/models/homecam.dart';
import 'package:aneukan/data/models/log.dart';
import 'package:aneukan/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:aneukan/data/repository/network/dto/user_dto.dart';
import 'package:aneukan/data/repository/network/dto/homecam_access_dto.dart';
import 'package:aneukan/data/repository/network/dto/log_dto.dart';
import 'package:aneukan/data/repository/network/dto/homecam_detail_dto.dart';
import 'endpoints.dart';

class ApiService {
  final String baseUrl = dotenv.env['API_BASE_URL'] ?? '';

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
      final request = {
        'identifier': id,
        'password': password,
        'name': name,
        'phone_num': phone
      };

      final response = await http.post(
        Uri.parse('$baseUrl/${Endpoint.postRegister.path}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request),
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

  Future<User> getMyInfo(int key) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/${Endpoint.getMyInfo.path}?id=$key'));

      if (response.statusCode == 200) {
        final dto = UserDto.fromJson(jsonDecode(response.body));
        return User(
          id: dto.id,
          name: dto.accessorName,
          userId: dto.accessorId,
          phone: dto.accessorPhoneNumber,
        );
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }

  Future<List<AccessInfo>> getHomecamAccessList(int key) async {
    try {
      final response = await http.get(Uri.parse(
          '$baseUrl/${Endpoint.getHomecamAccessList.path}?userid=$key'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final dtos =
            jsonList.map((dto) => HomecamAccessDto.fromJson(dto)).toList();
        return dtos
            .map((dto) => AccessInfo(
                accessorId: dto.accessorId,
                homecamSerialNumber: dto.serialNumber,
                isAccessable: dto.isAccessable))
            .toList();
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }

  Future<Homecam> getHomecamDetail(String serialNumber) async {
    try {
      final response = await http.get(Uri.parse(
          '$baseUrl/${Endpoint.getHomecamDetail.path}?serialnum=$serialNumber'));

      if (response.statusCode == 200) {
        final dto = HomecamDetailDto.fromJson(jsonDecode(response.body));
        return Homecam(
          id: dto.id,
          serialNumber: dto.serialNumber,
        );
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }

  Future<List<Log>> getLogList(int homecamId) async {
    try {
      final response = await http.get(
          Uri.parse('$baseUrl/${Endpoint.getLog.path}?homecamid=$homecamId'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final dtos = jsonList.map((dto) => LogDto.fromJson(dto)).toList();
        return dtos
            .map((dto) => Log(
                id: dto.id,
                homecamId: dto.homecamId,
                videoUrl: dto.videoUrl,
                timestamp: dto.timestamp))
            .toList();
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }

  Future<int> getHomecamIdFromSerialNumber(String serialNumber) async {
    try {
      final response = await http.get(Uri.parse(
          '$baseUrl/${Endpoint.getHomecamIdFromSerialNumber.path}?serialnum=$serialNumber'));

      if (response.statusCode == 200) {
        final dto = HomecamDetailDto.fromJson(jsonDecode(response.body));
        return dto.id;
      } else {
        throw Exception('데이터 로딩 실패');
      }
    } catch (e) {
      throw Exception('네트워크 에러: $e');
    }
  }

  Future<void> postHomecamAccessPermissionRequest(
      int id, String serialNumber) async {
    try {
      final request = {
        'userid': id,
        'userhomecam': serialNumber,
        'access': true,
      };

      final response = await http.post(
        Uri.parse(
            '$baseUrl/${Endpoint.postHomecamAccessPermissionRequest.path}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request),
        encoding: Encoding.getByName('utf-8'),
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
