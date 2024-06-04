import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/response_model.dart';
import '../services/login_service.dart';

class LoginController {
  LoginRepository _repository = LoginRepository();
  bool isLoading = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  String errorMessage = ''; // Properti pesan kesalahan umum
  String errorMessageUsername = ''; // Properti pesan kesalahan username
  String errorMessagePassword = ''; // Properti pesan kesalahan password

  Future<MyResponse> login() async {
    try {
      // Validasi input
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();

      if (username.isEmpty || password.isEmpty) {
        errorMessage = ''; // Reset pesan kesalahan umum
        errorMessageUsername =
            "Username harus diisi"; // Set pesan kesalahan username
        errorMessagePassword =
            "Password harus diisi"; // Set pesan kesalahan password
        return MyResponse(status: 1, message: "Harap isi kedua bidang");
      }

      if (password.length < 8) {
        errorMessage = ''; // Reset pesan kesalahan umum
        errorMessagePassword =
            "Password minimal 8 karakter"; // Set pesan kesalahan password
        return MyResponse(
            status: 1, message: "Password harus memiliki minimal 8 karakter");
      }

      if (password.contains(' ')) {
        errorMessage = ''; // Reset pesan kesalahan umum
        errorMessagePassword =
            "Password tidak dapat menggunakan spasi"; // Set pesan kesalahan password
        return MyResponse(
            status: 1, message: "Password tidak boleh mengandung spasi");
      }

      http.Response result = await _repository.login(username, password);

      if (result.statusCode == 200) {
        Map<String, dynamic> myBody = jsonDecode(result.body);
        String? token = myBody['token'];

        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          errorMessage = "Login berhasil"; // Set pesan kesalahan umum
          errorMessageUsername = ''; // Reset pesan kesalahan username
          errorMessagePassword = ''; // Reset pesan kesalahan password
          return MyResponse(status: 200, message: errorMessage, data: myBody);
        } else {
          errorMessage =
              "Token tidak ditemukan dalam respons"; // Set pesan kesalahan umum
          return MyResponse(status: 1, message: errorMessage);
        }
      } else if (result.statusCode == 401) {
        errorMessage = ''; // Reset pesan kesalahan umum
        errorMessageUsername =
            "Username tidak ditemukan"; // Set pesan kesalahan username
        errorMessagePassword = "Password salah"; // Set pesan kesalahan password
        return MyResponse(status: 1, message: "Username atau password salah");
      } else {
        errorMessage = ''; // Reset pesan kesalahan umum
        errorMessageUsername = "Login gagal"; // Set pesan kesalahan username
        errorMessagePassword = "Login gagal"; // Set pesan kesalahan password
        return MyResponse(status: result.statusCode, message: "Login gagal");
        print('$result');
      }
    } catch (e) {
      errorMessage = ''; // Reset pesan kesalahan umum
      errorMessageUsername =
          "Terjadi kesalahan. Coba lagi"; // Set pesan kesalahan username
      errorMessagePassword =
          "Terjadi kesalahan. Coba lagi"; // Set pesan kesalahan password
      return MyResponse(status: 1, message: "Terjadi kesalahan. Coba lagi");
    }
  }
}
