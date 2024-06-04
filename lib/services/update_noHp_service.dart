import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:admin_komerce/models/update_noHp_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UpdateHp {
  
}
Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<void> saveDataToSharedPreferences(Map<String, dynamic> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonData = jsonEncode(data);
  await prefs.setString('user_data', jsonData);
}

Future<UpdateNoHp> fetchUserProfile(String email, String token) async {
  final apiUrl = 'http://192.168.1.136:9000/app/get-noHp';
  bool isLoading = false;

  final response = await http.get(
    Uri.parse('$apiUrl?email=$email'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  print('Response dari API: ${response.body}');

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    print('$data');
    await saveDataToSharedPreferences(data);
    return UpdateNoHp.fromJson(data);
  } else {
    throw ('Email Tidak Terdaftar di Database');
  }
}

Future<bool> updateNoHp(String newNoHp, String token) async {
  final apiUrl = 'http://192.168.1.136:9000/app/update-noHp';

  final Map<String, dynamic> requestBody = {
    'no_hp': newNoHp,
  };

  final body = jsonEncode(requestBody);

  final headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json; charset=UTF-8',
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: headers,
    body: body,
  );
  print('Response dari API: ${response.body}');

  if (response.statusCode == 200) {
    // Perubahan nomor HP berhasil.
    return true;
  } else {
    // Perubahan nomor HP gagal. Tampilkan pesan kesalahan jika tersedia.
    final responseBody = json.decode(response.body);
    final errorMessage = responseBody[
        'message']; // Ganti 'message' dengan kunci pesan kesalahan yang sesuai.
    return false;
  }
}
