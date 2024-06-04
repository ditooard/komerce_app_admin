import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5), // Warna abu-abu dengan tingkat kejernihan 0.5
      body: Center(
        child: Lottie.asset(
          'assets/json/Logo_Komerce_Loading_Page.json',
          fit: BoxFit.cover,
          height: 100,
          width: 100,
        ), // Menampilkan indikator loading
      ),
    );
  }
}
