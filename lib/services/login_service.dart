import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepository {
  Future<http.Response> login(String username, String password) {
    return http.post(Uri.parse("http://192.168.1.136:9000/login"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));
  }
}
