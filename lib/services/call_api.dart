import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iot_test_project/models/room.dart';
import 'package:iot_test_project/utils/config.dart';
import 'package:iot_test_project/utils/store.dart';

import '../models/api_response.dart';
import '../models/user.dart';

class CallApi {
  static Future<User> login(String username, String password) async {
    try {
      final response = await CallApi.post(
          '/api/user/auth',
          {
            'username': username,
            'password': password,
          },
          auth: false);
      if (response.status) {
        var user = User.fromJson(response.data as Map<String, dynamic>);
        if (user.token != null) {
          await Store.set('user', user.toJson());
          return user;
        }
      }
      return User();
    } catch (e) {
      return User();
    }
  }

  static Future<User> register(User user) async {
    try {
      final response = await CallApi.post('/api/user/register', user.toJson());
      if (response.status) {
        var user = User.fromJson(response.data as Map<String, dynamic>);
        if (user.token != null) {
          await Store.set('user', user.toJson());
          return user;
        }
      }
      return User();
    } catch (e) {
      return User();
    }
  }

  static Future<List<Room>> getAllRoom() async {
    try {
      final response = await CallApi.get('/api/room');

      List<Room> rooms = await response.data
          .map<Room>((room) => Room.fromJson(room as Map<String, dynamic>))
          .toList();
      return rooms;
    } catch (e) {
      return [];
    }
  }

  static Future<List<Room>> getRoom(air) async {
    var select = [];

    if (air == 1) {
      select.add('temp1');
    } else if (air == 2) {
      select.add('temp2');
    } else if (air == 3) {
      select.add('temp3');
    }

    select.add('datesave');
    select.add('timesave');

    try {
      final response =
          await CallApi.get('/api/room', query: {'select[]': select});
      List<Room> rooms = await response.data
          .map<Room>((room) => Room.fromJson(room as Map<String, dynamic>))
          .toList();
      return rooms;
    } catch (e) {
      return [];
    }
  }

  static Future<ApiResponse> get(String path,
      {bool auth = true, Map<String, dynamic>? query}) async {
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    if (auth) {
      headers['Authorization'] = Store.getValue('user', 'token');
    }

    var uri = Uri.https(Config.BASE_URL, path, query);

    final response = await http.get(
      uri,
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
