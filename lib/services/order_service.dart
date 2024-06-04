import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/order_model.dart';

class OrderService {
  final String baseUrl = 'http://192.168.1.136:9000/app/komship';
  bool isLoading = false;

  Future<Map<String, dynamic>> getOrderDetails(String orderNumber) async {
    final prefs = await SharedPreferences.getInstance();
    final bearerToken = prefs.getString('token');

    final response = await http.get(
      Uri.parse('$baseUrl?search=$orderNumber'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $bearerToken',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('SUCCES');
      return data;
    } else if (response.statusCode == 500) {
      // Menangani kasus jika status code adalah 401 (Unauthorized)
      print('URL yang digunakan: ${Uri.parse('$baseUrl?search=$orderNumber')}');
      print('Response API: ${response.body}');
      throw Exception(
          'Anda tidak memiliki otorisasi untuk mengakses data ini. Silakan login kembali.');
    } else {
      // Menangani kasus jika status code adalah selain 200 atau 401
      print('URL yang digunakan: ${Uri.parse('$baseUrl?search=$orderNumber')}');
      print('Response API: ${response.body}');
      final errorMessage = jsonDecode(response.body)['message'] ??
          'Gagal mengambil detail pesanan';
      throw Exception(errorMessage);
    }
  }
}
