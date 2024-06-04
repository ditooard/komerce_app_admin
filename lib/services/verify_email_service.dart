import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:admin_komerce/models/verify_email_model.dart';

class VerifyEmailService {
  final String apiUrl =
      'http://192.168.1.136:9000/app'; // Ganti dengan URL API sesuai dengan kebutuhan Anda

  Future<int> verifyEmail(VerifyEmail verifyEmail, String token) async {
    final response = await http.post(
      Uri.parse('$apiUrl/send-verify-mail'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Menggunakan token untuk otorisasi
      },
      body: jsonEncode(verifyEmail.toJson()),
    );

    if (response.statusCode == 200) {
      print('berhasil');
      return 200; // 200 = Success
    } else if (response.statusCode == 401) {
      print('verified');
      return 401; // 401 = Unauthorized
    } else if (response.statusCode == 404) {
      print('Not Found');
      return 404; // 404 = Not Found
    } else {
      print('gagal');
      return -1; // Kode status lain atau error
    }
  }
}
