// services/api_service.dart

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

class ApiService extends GetxService {
  static const baseUrl = 'https://outrate-apis.vercel.app/api/v2';

  Future<List<UserModel>> searchUsers(String token, String query) async {
    final url = Uri.parse('$baseUrl/User/SearchUsers');

    var request = http.MultipartRequest('GET', url);
    request.headers['Authorization'] = token;
    request.fields['query'] = query;

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await http.Response.fromStream(response);
      final data = json.decode(responseData.body);
      List<UserModel> users = (data['users'] as List)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList();
      return users;
    } else {
      final responseData = await http.Response.fromStream(response);
      final errorData = json.decode(responseData.body);
      throw Exception(errorData['message']);
    }
  }

  Future<UserModel> fetchUserById(String token, int userId) async {
    final url = Uri.parse('$baseUrl/User/GetUserById');

    var request = http.MultipartRequest('GET', url);
    request.headers['Authorization'] = token;
    request.fields['id'] = userId.toString();

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await http.Response.fromStream(response);
      final data = json.decode(responseData.body);
      return UserModel.fromJson(data['user']);
    } else {
      final responseData = await http.Response.fromStream(response);
      final errorData = json.decode(responseData.body);
      throw Exception(errorData['message']);
    }
  }
}
