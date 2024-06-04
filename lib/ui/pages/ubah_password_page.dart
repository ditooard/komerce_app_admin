import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin_komerce/models/ubah_pw_model.dart';
import 'package:admin_komerce/services/ubah_pw_service.dart';

import '../../shared/theme.dart';

class MyModel with ChangeNotifier {
  bool isFormFilled = false;

  void setFormFilled(bool value) {
    isFormFilled = value;
    notifyListeners();
  }
}

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  PasswordChange _passwordChange = PasswordChange(
    current_password: '',
    new_password: '',
    confirm_password: '',
  );

  late String _token;

  bool _showCurrentPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _loadTokenFromSharedPreferences();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      // Setelah widget dibangun sepenuhnya, Anda dapat mengakses context dan melakukan perubahan state.
      Provider.of<MyModel>(context, listen: false).setFormFilled(false);
    });
  }

  void _loadTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Color orangeColor = Color(0xffF95031);
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Menghapus shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.black), // Ubah ikon dan warna
          onPressed: () {
            Navigator.pop(
                context); // Menggunakan Navigator.pop() untuk navigasi kembali
          },
        ),
        backgroundColor: Colors.white, // Ubah latar belakang
        title: Text(
          'Ubah Password',
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
            padding:
                EdgeInsets.fromLTRB(24 * fem, 12 * fem, 24 * fem, 30 * fem),
            width: double.infinity,
            height: 90 * fem,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: ElevatedButton(
              onPressed: myModel.isFormFilled
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 217 * fem,
                                height: 150.7 *
                                    fem, // Menambahkan tinggi agar dialog lebih proporsional
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 14.4 * fem),
                                      width: 58.8 * fem,
                                      height: 55.2 * fem,
                                      child: Image.asset(
                                        'assets/images/alert-icon.png',
                                        width: 58.8 * fem,
                                        height: 55.2 * fem,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem,
                                          0 * fem,
                                          0 * fem,
                                          5 * fem), // Memberi margin ke teks
                                      constraints: BoxConstraints(
                                        maxWidth: 197 * fem,
                                      ),
                                      child: Text(
                                        'Yakin ingin mengubah\npassword ?',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 97.50,
                                            height: 25,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF999999),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Tidak',
                                                  style: TextStyle(
                                                    color: Color(0xFF999999),
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              4, // Jarak antara tombol "Tidak" dan "Iya"
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            final passwordChangeService =
                                                PasswordChangeService();
                                            passwordChangeService
                                                .changePassword(
                                                    _passwordChange, _token)
                                                .then((success) {
                                              if (success) {
                                                Navigator.of(context)
                                                    .pop(); // Tutup dialog
                                                Navigator.of(context)
                                                    .pushReplacementNamed(
                                                        '/ubahpassword'); // Tutup dialog
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      content: Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                0 * fem,
                                                                0 * fem),
                                                        width: 217 * fem,
                                                        height: 100 * fem,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffffffff),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8 * fem),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      14.4 *
                                                                          fem),
                                                              width: 58.8 * fem,
                                                              height:
                                                                  55.2 * fem,
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/success-icon.png',
                                                                width:
                                                                    58.8 * fem,
                                                                height:
                                                                    55.2 * fem,
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0 * fem),
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth:
                                                                    197 * fem,
                                                              ),
                                                              child: Text(
                                                                'Selamat data anda berhasil di ubah.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Plus Jakarta Sans',
                                                                  fontSize:
                                                                      12 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height: 1.26 *
                                                                      ffem /
                                                                      fem,
                                                                  color: Color(
                                                                      0xff333333),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 30 * fem,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xfff95031),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8 * fem),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Oke',
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Plus Jakarta Sans',
                                                                  fontSize:
                                                                      12 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1.26 *
                                                                      ffem /
                                                                      fem,
                                                                  color: Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              } else {
                                                Navigator.of(context).pop();
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      content: Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                0 * fem,
                                                                0 * fem),
                                                        width: 217 * fem,
                                                        height: 100 * fem,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffffffff),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8 * fem),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      14.4 *
                                                                          fem),
                                                              width: 58.8 * fem,
                                                              height:
                                                                  55.2 * fem,
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/failed-icon.png',
                                                                width:
                                                                    58.8 * fem,
                                                                height:
                                                                    55.2 * fem,
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0 * fem),
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth:
                                                                    197 * fem,
                                                              ),
                                                              child: Text(
                                                                'Ada kesalahan saat mengubah data.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Plus Jakarta Sans',
                                                                  fontSize:
                                                                      12 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height: 1.26 *
                                                                      ffem /
                                                                      fem,
                                                                  color: Color(
                                                                      0xff333333),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 30 * fem,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xfff95031),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8 * fem),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Kembali',
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Plus Jakarta Sans',
                                                                  fontSize:
                                                                      12 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1.26 *
                                                                      ffem /
                                                                      fem,
                                                                  color: Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            });
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Iya',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
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
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary: myModel.isFormFilled ? Color(0xffF95031) : Colors.grey,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8 * fem),
              ),
              padding: EdgeInsets.symmetric(vertical: 0 * fem),
              ),
              child: Text('Simpan'), // Ubah warna teks menjadi putih
            )),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password Lama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showCurrentPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showCurrentPassword = !_showCurrentPassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  obscureText: !_showCurrentPassword,
                  onChanged: (value) {
                    setState(() {
                      myModel.setFormFilled(value.isNotEmpty);
                      _passwordChange.current_password = value;
                    });
                  },
                ),
                SizedBox(height: 20), // Tambahkan jarak antara inputan
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password Baru',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showNewPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showNewPassword = !_showNewPassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  obscureText: !_showNewPassword,
                  onChanged: (value) {
                    setState(() {
                      myModel.setFormFilled(value.isNotEmpty);
                      _passwordChange.new_password = value;
                    });
                  },
                ),
                SizedBox(height: 16), // Tambahkan jarak antara inputan
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password Baru',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showConfirmPassword = !_showConfirmPassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  obscureText: !_showConfirmPassword,
                  onChanged: (value) {
                    setState(() {
                      myModel.setFormFilled(value.isNotEmpty);
                      _passwordChange.confirm_password = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
