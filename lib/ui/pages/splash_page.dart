import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isDisposed = false; // variabel untuk melacak apakah widget sudah di-"dispose"

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (!_isDisposed) {
        checkAuthentication();
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true; // _isDisposed menjadi true saat widget di-"dispose"
    super.dispose();
  }

  // Fungsi untuk memeriksa otentikasi
  Future<void> checkAuthentication() async {
    if (_isDisposed) return; // Periksa kembali apakah widget sudah di-"dispose"

    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');

    if (savedToken != null && savedToken.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/landing');
    } else {
      // Jika token belum tersimpan, alihkan ke halaman login.
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Mengatur konten di tengah layar
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 182,
                height: 67.69,
              ),
              SizedBox(
                height: 16, // Menambahkan jarak antara gambar dan teks
              ),
              Text(
                'my.komerce.id',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB3B3B3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
