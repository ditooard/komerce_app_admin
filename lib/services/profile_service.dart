import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchUserProfile(String token) async {
  final response = await http.get(
    Uri.parse('http://192.168.1.136:9000/app/profile/detail'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    // Sukses mengambil data, menguraikan respons JSON
    final Map<String, dynamic> data = jsonDecode(response.body);
    // print(jsonDecode(response.body));
    return data;
  } else {
    // Gagal mengambil data, tangani kesalahan
    throw Exception('Gagal mengambil data profil');
  }
}
