import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin_komerce/models/response_model.dart';
import 'package:admin_komerce/controller/login_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController _controller = LoginController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  String _password = '';
  String _username = '';

  void _login() async {
    setState(() {
      _controller.isLoading = true;
    });

    MyResponse response = await _controller.login();

    setState(() {
      _controller.isLoading = false;
    });

    if (response.status == 200) {
      // Berhasil masuk
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(
          'username',
          _controller
              .usernameController.text); // Menggunakan controller yang sesuai
      Navigator.of(context).pushNamed('/landing');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return WillPopScope(
      onWillPop: () async {
        // Menampilkan dialog konfirmasi keluar aplikasi
        final shouldExit = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 247 * fem,
                height: 155 *
                    fem, // Menambahkan tinggi agar dialog lebih proporsional
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 14.4 * fem),
                      width: 58.8 * fem,
                      height: 55.2 * fem,
                      child: Image.asset(
                        'assets/images/alert-icon.png',
                        width: 58.8 * fem,
                        height: 55.2 * fem,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem,
                          10 * fem), // Memberi margin ke teks
                      constraints: BoxConstraints(
                        maxWidth: 197 * fem,
                      ),
                      child: Text(
                        'Anda yakin ingin keluar dari aplikasi ?',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Plus Jakarta Sans',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1 * ffem / fem,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(
                                false); // Menutup dialog dengan nilai false (Batal)
                          },
                          child: Container(
                            width: 97.50,
                            height: 25,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Color(0xFF999999),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tidak',
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 12,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4, // Jarak antara tombol "Tidak" dan "Iya"
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(
                                true); // Menutup dialog dengan nilai true (Keluar)
                          },
                          child: Container(
                            width: 97.50,
                            height: 25,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFF94F31),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Iya',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );

        // Jika pengguna memilih "Keluar", maka aplikasi akan keluar langsung
        if (shouldExit == true) {
          // Keluar dari aplikasi tanpa kembali ke halaman sebelumnya
          Navigator.of(context).pop(); // Menutup halaman Login
          SystemNavigator.pop(); // Keluar dari aplikasi
        }

        return false; // Tetap di halaman Login jika memilih "Batal"
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(32 * fem, 120 * fem, 32 * fem, 0 * fem),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Container(
                        margin: EdgeInsets.only(bottom: 31.5 * fem),
                        constraints: BoxConstraints(
                          maxWidth: 215 * fem,
                        ),
                        child: Text(
                          'Login to\nyour Account',
                          style: TextStyle(
                            fontSize: 32 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.26 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 31 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 12 * fem),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                          height: 20), // Beri jarak dari atas
                                      Center(
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: [
                                            
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    child: Align(
                                                      alignment: Alignment
                                                          .centerLeft, // Mengatur label ke kiri
                                                      child: Text(
                                                        'Username',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ), // Beri jarak dari elemen sebelumnya
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: _controller
                                                                .errorMessageUsername
                                                                .isNotEmpty
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                              10), // Tambahkan jarak horizontal
                                                      child: TextFormField(
                                                        controller: _controller
                                                            .usernameController,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Masukkan username kamu',
                                                          hintStyle: TextStyle(
                                                              color: Color(
                                                                  0xffB3B3B3)),
                                                          border: InputBorder
                                                              .none, // Hilangkan border bawaan TextFormField
                                                        ),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors
                                                              .black, // Menggunakan warna #B3B3B3
                                                        ),
                                                        onChanged: (value) {
                                                          // Reset pesan kesalahan username saat nilai berubah
                                                          setState(() {
                                                            _controller
                                                                .errorMessageUsername = '';
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  // Tampilkan pesan kesalahan username jika ada
                                                  if (_controller
                                                      .errorMessageUsername
                                                      .isNotEmpty)
                                                    Align(
                                                      alignment: Alignment
                                                          .centerLeft, // Mengatur teks rata kiri
                                                      child: Text(
                                                        _controller
                                                            .errorMessageUsername,
                                                        style: TextStyle(
                                                          color: Colors
                                                              .red, // Ganti warna teks sesuai kebutuhan
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.fromLTRB(0, 10, 0,
                                            0), // Beri jarak dari elemen sebelumnya
                                        child: Column(
                                          children: [
                                            // Label teks
                                            Align(
                                              alignment: Alignment
                                                  .centerLeft, // Mengatur label ke kiri
                                              child: Text(
                                                'Password',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    5), // Beri jarak antara label dan input
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: _controller
                                                          .errorMessagePassword
                                                          .isNotEmpty
                                                      ? Colors.red
                                                      : Colors.grey,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                        10), // Tambahkan jarak horizontal
                                                child: Stack(
                                                  alignment: Alignment
                                                      .centerRight, // Mengatur ikon mata ke kanan
                                                  children: [
                                                    TextFormField(
                                                      obscureText:
                                                          !_isPasswordVisible,
                                                      controller: _controller
                                                          .passwordController,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Password kamu',
                                                        hintStyle: TextStyle(
                                                            color: Color(
                                                                0xffB3B3B3)),
                                                        border: InputBorder
                                                            .none, // Hilangkan border bawaan TextFormField
                                                      ),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                      onChanged: (value) {
                                                        // Reset pesan kesalahan password saat nilai berubah
                                                        setState(() {
                                                          _controller
                                                              .errorMessagePassword = '';
                                                        });
                                                      },
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        _isPasswordVisible
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off,
                                                        color: Colors
                                                            .grey, // Warna ikon mata
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          _isPasswordVisible =
                                                              !_isPasswordVisible;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // Tampilkan pesan kesalahan password jika ada
                                            if (_controller.errorMessagePassword
                                                .isNotEmpty)
                                              Align(
                                                alignment: Alignment
                                                    .centerLeft, // Mengatur teks rata kiri
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                    _controller
                                                        .errorMessagePassword,
                                                    style: TextStyle(
                                                      color: Colors
                                                          .red, // Ganti warna teks sesuai kebutuhan
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // TextButton(
                            //   onPressed: () {
                            //     Navigator.of(context)
                            //         .pushNamed('/lupapassword');
                            //   },
                            //   child: Text(
                            //     'Lupa password?',
                            //     style: TextStyle(
                            //       fontSize: 12 * ffem,
                            //       fontWeight: FontWeight.w700,
                            //       height: 1.26 * ffem / fem,
                            //       color: Color(0xff818181),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      (_controller.isLoading)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              onPressed: _login,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                elevation: MaterialStateProperty.all<double>(0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 40 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xfff95031),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Plus Jakarta Sans',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.26 * ffem / fem,
                                        letterSpacing: 0.1000000015 * fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
