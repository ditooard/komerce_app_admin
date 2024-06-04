import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:admin_komerce/models/ubah_pw_model.dart';

class PasswordChangeService {
  final String apiUrl =
      'http://192.168.1.136:9000/app/profile'; // Ganti dengan URL API sesuai dengan kebutuhan Anda

  Future<bool> changePassword(
      PasswordChange passwordChange, String token) async {
    final response = await http.put(
      Uri.parse('$apiUrl/update-password'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Menggunakan token untuk otorisasi
      },
      body: jsonEncode(passwordChange.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
