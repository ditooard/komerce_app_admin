import 'package:flutter/material.dart';
import 'package:admin_komerce/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin_komerce/ui/widgets/custom_buttom_navigation_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/profile_service.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String namaLengkap = '';
  String divisi = '';

  Future<void> loadUserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      Map<String, dynamic> userProfile = await fetchUserProfile(token!);

      // Set data profil pengguna ke state atau variabel di halaman profil
      setState(() {
        namaLengkap = userProfile['data']['nama_lengkap'];
        divisi = userProfile['data']['divisi'];
      });
    } catch (e) {
      // Tangani kesalahan jika terjadi
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(  
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Ubah latar belakang
        elevation: 0, // Menghapus shadow
        child: Container(
          padding: EdgeInsets.fromLTRB(24 * fem, 0 * fem, 24 * fem, 52 * fem),
          width: double.infinity,
          height: 110 * fem,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 141, 74, 74).withOpacity(0),
          ),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
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
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem,
                                0 * fem, 10 * fem), // Memberi margin ke teks
                            constraints: BoxConstraints(
                              maxWidth: 197 * fem,
                            ),
                            child: Text(
                              'Anda yakin ingin keluar dari akun anda ?',
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
                                  Navigator.of(context).pop();
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                width:
                                    4, // Jarak antara tombol "Tidak" dan "Iya"
                              ),
                              TextButton(
                                onPressed: () {
                                  _logout(context);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8 * fem),
              ),
              padding: EdgeInsets.symmetric(vertical: 0 * fem),
              shadowColor: Colors.black,
              elevation: 1,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        20 * fem, 1 * fem, 167 * fem, 0 * fem),
                    child: Text(
                      'Keluar Akun',
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.26 * ffem / fem,
                        color: Color(0xffe31a1a),
                      ),
                    ),
                  ),
                  Container(
                    width: 24 * fem,
                    height: 24 * fem,
                    child: Image.asset(
                      'assets/images/logout.png',
                      color: Color(
                          0xfff95031), // Gantilah dengan warna yang sesuai
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
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
                      12 * fem, 15 * fem, 16.71 * fem, 23 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            12 * fem, 40 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'Profile',
                          style: SafeGoogleFont(
                            'Plus Jakarta Sans',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.26 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      24 * fem, 12 * fem, 24 * fem, 12 * fem),
                  width: double.infinity,
                  height: 96 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/detailprofile');
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 80 * fem, 0 * fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 5 * fem, 0 * fem),
                                width: 72 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xfff95031),
                                  borderRadius: BorderRadius.circular(36 * fem),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    (namaLengkap.isNotEmpty ? namaLengkap[0] : ''),
                                    style: SafeGoogleFont(
                                      'Plus Jakarta Sans',
                                      fontSize: 38.4000015259 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 14.5 * fem, 0 * fem, 13.5 * fem),
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 7 * fem),
                                      child: Text(
                                        namaLengkap,
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.26 * ffem / fem,
                                          color: Color(0xff333333),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      divisi,
                                      style: SafeGoogleFont(
                                        'Plus Jakarta Sans',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.26 * ffem / fem,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/detailprofile');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .end, // Mengatur ikon di pojok kanan
                            children: [
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xfff95031),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/ubahpassword');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        24 * fem, 16 * fem, 24 * fem, 47 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 230 * fem),
                          padding: EdgeInsets.fromLTRB(
                              12 * fem, 12 * fem, 12 * fem, 12 * fem),
                          width: double.infinity,
                          height: 48 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(8 * fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x19000000),
                                offset: Offset(0 * fem, 0 * fem),
                                blurRadius: 10.5 * fem,
                              ),
                            ],
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 8 * fem, 0 * fem),
                                  width: 24 * fem,
                                  height: 24 * fem,
                                  child: Image.asset(
                                    'assets/images/security-safe.png',
                                    color: Color(
                                        0xfff95031), // Gantilah dengan warna yang sesuai
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 4 * fem, 0 * fem, 3.5 * fem),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0.5 * fem, 169 * fem, 0 * fem),
                                        child: Text(
                                          'Ubah Password',
                                          style: SafeGoogleFont(
                                            'Plus Jakarta Sans',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.26 * ffem / fem,
                                            letterSpacing: -0.25 * fem,
                                            color: Color(0xff818181),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 0.5 * fem),
                                        width: 16 * fem,
                                        height: 16 * fem,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color:
                                              Color.fromARGB(255, 245, 75, 32),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    // Hapus token dari SharedPreferences
    await prefs.remove('token');
    print('Token dihapus.');

    Navigator.pushReplacementNamed(context, '/login');
  }
}
