import 'package:flutter/material.dart';

class TambahAlamat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Alamat Page'),
        backgroundColor: Color(0xffF95031),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'tambah alamat page',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
