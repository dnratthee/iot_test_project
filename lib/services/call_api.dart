import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iot_test_project/utils/config.dart';
import 'package:iot_test_project/utils/store.dart';

import '../models/api_response.dart';
import '../models/user.dart';

class CallApi {
  static Future<dynamic> login(String username, String password) async {
    final response = await CallApi.post(
        '/user/auth',
        {
          'username': username,
          'password': password,
        },
        auth: false);
    if (response.status) {
      var user = User.fromJson(response.data as Map<String, dynamic>);
      await Store.set('user', user.toJson());
      return user.toJson();
    } else {
      return null;
    }
  }

  static Future<dynamic> register(User user) async {
    final response =
        await CallApi.post('/user/register', user.toJson(), auth: false);
    if (response.status) {
      var user = User.fromJson(response.data as Map<String, dynamic>);
      await Store.set('user', user.toJson());
      return user.toJson();
    } else {
      return null;
    }
  }

  static Future<ApiResponse> get(String uri, {bool auth = true}) async {
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    if (auth) {
      headers['Authorization'] = Store.getValue('user', 'token');
    }

    final response = await http.get(
      Uri.parse('${Config.BASE_URL}$uri'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      return ApiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }
  }

  static Future<ApiResponse> post(String uri, Map<String, dynamic> data,
      {bool auth = true}) async {
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    if (auth && Store.has('user')) {
      headers['Authorization'] = Store.getValue('user', 'token');
    }

    final response = await http.post(
      Uri.parse('${Config.BASE_URL}$uri'),
      headers: headers,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      return ApiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }
  }
}
