import 'package:food_delivery/models/user_model.dart';
import 'package:food_delivery/services/http_service.dart';
import 'dart:convert';

class ApiService {
  final String _baseUrl = 'http://192.168.1.155:8000';

  final HttpService _httpService = HttpService();

  Future<List<User>> getUsers() async {
    final response = await _httpService.get('$_baseUrl/auth/login');

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Map> loginUser(String email, String password) async {
    final Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };
    final response = await _httpService.post(
        '$_baseUrl/auth/login', jsonEncode(requestBody));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      print("Geçersiz Şifre");
      return {
        'error': 'Geçersiz Şifre',
      };
    } else if (response.statusCode == 404) {
      print("Kullanıcı Bulunamadı");
      return {
        'error': 'Kullanıcı Bulunamadı',
      };
    } else {
      throw Exception('Failed to login user');
    }
  }

  Future<Map> registerUser(String email, String password) async {
    final Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };
    final response = await _httpService.post(
        '$_baseUrl/auth/register', jsonEncode(requestBody));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      print("Kullanıcı zaten kayıtlı");
      return {
        'error': 'Kullanıcı zaten kayıtlı',
      };
    } else {
      throw Exception('Failed to register user');
    }
  }
}
