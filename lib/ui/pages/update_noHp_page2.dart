import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/update_noHp_service.dart';
import '../../shared/theme.dart';

class MyModel4 with ChangeNotifier {
  bool isFormFilled = false;

  void setFormFilled(bool value) {
    isFormFilled = value;
    notifyListeners();
  }
}

class UpdateNoHp2 extends StatefulWidget {
  const UpdateNoHp2({super.key});

  @override
  State<UpdateNoHp2> createState() => _UpdateNoHp2State();
}

class _UpdateNoHp2State extends State<UpdateNoHp2> {
  Map<String, dynamic> userData = {};
  String noHp = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _newNoHpController = TextEditingController();
  String? token;

  @override
  void initState() {
    super.initState();
    loadDataFromSharedPreferences();
    loadToken();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Setelah widget dibangun sepenuhnya, Anda dapat mengakses context dan melakukan perubahan state.
      Provider.of<MyModel4>(context, listen: false).setFormFilled(false);
    });
  }

  Future<void> loadDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = prefs.getString('user_data') ?? '{}';
    setState(() {
      userData = json.decode(jsonData);
    });
    print('Data ditemukan: $userData');

    noHp = userData['data']['no Hp'] ?? ''; // Menginisialisasi nilai noHp
    if (noHp.isNotEmpty && noHp.startsWith('0')) {
      noHp = noHp.substring(1);
    }
    print('$noHp');
  }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print('Token: $token');
  }

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel4>(context);
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Menghapus shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black), // Ubah ikon dan warna
          onPressed: () {
            Navigator.pop(
                context); // Menggunakan Navigator.pop() untuk navigasi kembali
          },
        ),
        backgroundColor: Colors.white, // Ubah latar belakang
        title: Text(
          'Update No. Hp',
          style: TextStyle(
            color: Colors.black, // Ubah warna teks
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Ubah latar belakang
        elevation: 0, // Menghapus shadow
        child: Container(
          padding: EdgeInsets.fromLTRB(24 * fem, 12 * fem, 24 * fem, 12 * fem),
          width: double.infinity,
          height: 63 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: ElevatedButton(
            onPressed: myModel.isFormFilled
                ? () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(
                              24 * fem, 15 * fem, 24 * fem, 32 * fem),
                          width: 375 * fem,
                          height: 509 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30 * fem),
                              topRight: Radius.circular(30 * fem),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(135.5 * fem,
                                    0 * fem, 135.5 * fem, 32 * fem),
                                width: double.infinity,
                                height: 6 * fem,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3 * fem),
                                  color: Color(0xffc2c2c2),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(42.5 * fem,
                                          0 * fem, 42.5 * fem, 28 * fem),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 24 * fem),
                                            width: 210 * fem,
                                            height: 229 * fem,
                                            child: Image.asset(
                                              'assets/images/konfirmasinohp.png',
                                              width: 210 * fem,
                                              height: 229 * fem,
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      7 * fem),
                                                  child: Text(
                                                    'Ganti No HP',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 20 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Anda yakin untuk mengubah data ini?',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Plus Jakarta Sans',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.26 * ffem / fem,
                                                    color: Color(0xff818181),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  0 * fem,
                                                  12 * fem),
                                              padding: EdgeInsets.fromLTRB(
                                                  114 * fem,
                                                  8 * fem,
                                                  130 * fem,
                                                  8 * fem),
                                              width: double.infinity,
                                              height: 40 * fem,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xfff95031)),
                                                color: Color(0xffffffff),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8 * fem),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    19.5 * fem,
                                                    1.5 * fem,
                                                    0 * fem,
                                                    1.5 * fem),
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Text(
                                                  'Kembali',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5 * ffem / fem,
                                                    color: Color(0xfff95031),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (_formKey.currentState !=
                                                      null &&
                                                  _formKey.currentState!
                                                      .validate()) {
                                                final newNoHp =
                                                    _newNoHpController.text;
                                                final tokenValue = token ?? "";
                                                updateNoHp(newNoHp, tokenValue)
                                                    .then(
                                                  (result) {
                                                    if (result == true) {
                                                      Navigator.pushNamed(
                                                          context, '/landing');
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            'No. HP berhasil diubah',
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 3,
                                                        backgroundColor:
                                                            Color(0x99c2c2c2),
                                                        textColor:
                                                            Color(0xff333333),
                                                        fontSize: 16 * ffem,
                                                      );
                                                    } else if (result ==
                                                        false) {
                                                      Navigator.pop(context);
                                                      final snackBar = SnackBar(
                                                        content: Text(
                                                            'Pastikan isi No HP dengan Benar'),
                                                        duration: Duration(
                                                            seconds: 3),
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    }
                                                  },
                                                );
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  143.5 * fem,
                                                  8 * fem,
                                                  140 * fem,
                                                  8 * fem),
                                              width: double.infinity,
                                              height: 40 * fem,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xfff95031)),
                                                color: Color(0xfff95031),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8 * fem),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Center(
                                                  child: Text(
                                                    'Yakin',
                                                    style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.5 * ffem / fem,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: myModel.isFormFilled ? Color(0xffF95031) : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8 * fem),
              ),
              padding: EdgeInsets.symmetric(vertical: 0 * fem),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text(
                  'Ubah Nomor HP',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.5 * ffem / fem,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        24 * fem, 30 * fem, 24 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 32 * fem),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                  child: Text(
                                    'Email',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      14 * fem, 8 * fem, 14 * fem, 8 * fem),
                                  width: double.infinity,
                                  height: 40 * fem,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffe2e2e2)),
                                    color: Color(0xfff8f8f8),
                                    borderRadius:
                                        BorderRadius.circular(8 * fem),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 128 * fem, 0 * fem),
                                    width: 171 * fem,
                                    height: double.infinity,
                                    child: Center(
                                      child: Text(
                                        userData['data']['email'] ??
                                            'Email tidak ada',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xffc2c2c2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 6 * fem),
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 26 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                child: Text(
                                  'No.Hp Lama',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 40 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xfff8f8f8),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Container(
                                        width: 54 * fem,
                                        height: 40 * fem,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffe2e2e2)),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8 * fem),
                                            bottomLeft:
                                                Radius.circular(8 * fem),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '+62',
                                            style: SafeGoogleFont(
                                              'Poppins',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xff626262),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 53 * fem,
                                      top: 0 * fem,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(14 * fem,
                                            8 * fem, 14 * fem, 8 * fem),
                                        width: 273 * fem,
                                        height: 40 * fem,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffe2e2e2)),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8 * fem),
                                            bottomRight:
                                                Radius.circular(8 * fem),
                                          ),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 0 * fem),
                                          width: 120 * fem,
                                          height: double.infinity,
                                          child: Text(
                                            noHp,
                                            style: SafeGoogleFont(
                                              'Poppins',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffc2c2c2),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 6 * fem),
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 26 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                child: Text(
                                  'No.Hp Baru',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 40 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xfff8f8f8),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Container(
                                        width: 54 * fem,
                                        height: 40 * fem,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffe2e2e2)),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8 * fem),
                                            bottomLeft:
                                                Radius.circular(8 * fem),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '+62',
                                            style: SafeGoogleFont(
                                              'Poppins',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xff626262),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 53 * fem,
                                      top: 0 * fem,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(14 * fem,
                                            8 * fem, 14 * fem, 8 * fem),
                                        width: 273 * fem,
                                        height: 40 * fem,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffe2e2e2)),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8 * fem),
                                            bottomRight:
                                                Radius.circular(8 * fem),
                                          ),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 0 * fem),
                                          width: 120 * fem,
                                          height: double.infinity,
                                          child: Form(
                                            key: _formKey,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                setState(() {
                                                  myModel.setFormFilled(
                                                      value.isNotEmpty);
                                                });
                                              },
                                              controller: _newNoHpController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5 * ffem / fem,
                                                color: Colors.black,
                                              ),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ], // Batasi input hanya menerima angka.
                                            ),
                                          ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
