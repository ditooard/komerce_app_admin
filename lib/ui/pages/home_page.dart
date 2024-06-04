import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admin_komerce/shared/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/profile_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String namaLengkap = ''; // Variabel untuk menyimpan nama pengguna

  Future<void> _refreshData() async {
    // Logika pembaruan data disini
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> loadUserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      Map<String, dynamic> userProfile = await fetchUserProfile(token!);

      // Set data profil pengguna ke state atau variabel di halaman profil
      setState(() {
        namaLengkap = userProfile['data']['nama_lengkap'];
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

  Widget build(BuildContext context) {
    double baseWidth = 370;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xfff95031),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 24 * fem,
                      top: 70 * fem,
                      child: Container(
                        width: 327 * fem,
                        height: 48 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 110 * fem, 0 * fem),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                    child: Text(
                                      'Halo $namaLengkap,',
                                      style: SafeGoogleFont(
                                        'Plus Jakarta Sans',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.26 * ffem / fem,
                                        color: Color(0xfffafafa),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Selamat Datang !',
                                    style: SafeGoogleFont(
                                      'Plus Jakarta Sans',
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.26 * ffem / fem,
                                      color: Color(0xfffafafa),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              width: 44 * fem,
                              height: 44 * fem,
                              child: Container(
                                width: 44,
                                height: 44,
                                padding: const EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF6F6F6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/notification.png',
                                  color: Colors
                                      .black, // Gantilah dengan warna yang sesuai
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 375 * fem,
                          height: 273 * fem,
                          child: Image.asset(
                            'assets/images/backgroundatas.png',
                            width: 375 * fem,
                            height: 273 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0 * fem,
                      top: 150 * fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 20 * fem, 0 * fem, 0 * fem),
                        width: 375 * fem,
                        height:  MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Color(0xfffafafa),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30 * fem),
                            topRight: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  151.5 * fem, 0 * fem, 151.5 * fem, 16 * fem),
                              width: double.infinity,
                              height: 3 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffe2e2e2),
                                borderRadius: BorderRadius.circular(16 * fem),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 16 * fem),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        24 * fem, 0 * fem, 24 * fem, 0 * fem),
                                    width: double.infinity,
                                    height: 109 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(8 * fem),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xfff95031),
                                        borderRadius:
                                            BorderRadius.circular(8 * fem),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0 * fem,
                                            top: 0 * fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 375 * fem,
                                                height: 273 * fem,
                                                child: Image.asset(
                                                  'assets/images/backgroundatas.png',
                                                  width: 375 * fem,
                                                  height: 273 * fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 12 * fem,
                                            top: 25.5 * fem,
                                            child: Container(
                                              width: 303 * fem,
                                              height: 59 * fem,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        0 * fem,
                                                        4 * fem),
                                                    width: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0 * fem,
                                                                  0.5 * fem,
                                                                  162 * fem,
                                                                  0 * fem),
                                                          child: Text(
                                                            'Saldo Komerce',
                                                            style:
                                                                SafeGoogleFont(
                                                              'Plus Jakarta Sans',
                                                              fontSize:
                                                                  16 * ffem,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.26 *
                                                                  ffem /
                                                                  fem,
                                                              color: Color(
                                                                  0xfffafafa),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 24 * fem,
                                                          height: 24 * fem,
                                                          child: Image.asset(
                                                            'assets/images/info-circle.png',
                                                            width: 375 * fem,
                                                            height: 273 * fem,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    'Rp. 999.999.999',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 24 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xfffafafa),
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
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 24 * fem),
                                    width: double.infinity,
                                    height: 65 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8 * fem), // Atur borderRadius di sini
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/CardSaldo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Color(0xfffba63c),
                                        borderRadius: BorderRadius.circular(8 *
                                            fem), // Atur borderRadius di sini
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 12 * fem,
                                            top: 12 * fem,
                                            child: Container(
                                              width: 303 * fem,
                                              height: 43 * fem,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        0 * fem,
                                                        4 * fem),
                                                    width: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0 * fem,
                                                                  1 * fem,
                                                                  179 * fem,
                                                                  0 * fem),
                                                          child: Text(
                                                            'Request Penarikan',
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
                                                                  0xfffafafa),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 18 * fem,
                                                          height: 18 * fem,
                                                          child: Image.asset(
                                                            'assets/images/info-circle.png',
                                                            width: 375 * fem,
                                                            height: 273 * fem,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    'Rp. 999.999.999',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 16 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xfffafafa),
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
                            Container(
                              child: Container(
                                margin:
                                    EdgeInsets.symmetric(horizontal: 28 * fem),
                                width: double.infinity,
                                height: 79 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/cariorder');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          elevation: 0,
                                          padding: EdgeInsets.all(0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8 * fem),
                                          ),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    8 * fem),
                                                width: 40 * fem,
                                                height: 40 * fem,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffffffff),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12 * fem),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x28000000),
                                                      offset: Offset(
                                                          0 * fem, 0 * fem),
                                                      blurRadius: 8 * fem,
                                                    ),
                                                  ],
                                                ),
                                                child: Image.asset(
                                                  'assets/images/bag-tick.png',
                                                  color: Color(
                                                      0xfff95031), // Gantilah dengan warna yang sesuai
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 35 * fem,
                                                ),
                                                child: Text(
                                                  'Cari\nOrder',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Plus Jakarta Sans',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.26 * ffem / fem,
                                                    color: Color(0xff626262),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/updatenohp1');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          elevation: 0,
                                          padding: EdgeInsets.all(0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8 * fem),
                                          ),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    8 * fem),
                                                width: 40 * fem,
                                                height: 40 * fem,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffffffff),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12 * fem),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x28000000),
                                                      offset: Offset(
                                                          0 * fem, 0 * fem),
                                                      blurRadius: 8 * fem,
                                                    ),
                                                  ],
                                                ),
                                                child: Image.asset(
                                                  'assets/images/mobile-programming.png',
                                                  color: Color(
                                                      0xfff95031), // Gantilah dengan warna yang sesuai
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 43 * fem,
                                                ),
                                                child: Text(
                                                  'Update\nNo. HP',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Plus Jakarta Sans',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.26 * ffem / fem,
                                                    color: Color(0xff626262),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    // Flexible(
                                    //   child: ElevatedButton(
                                    //     onPressed: () {
                                    //       Navigator.pushNamed(
                                    //           context, '/tambahalamat');
                                    //     },
                                    //     style: ElevatedButton.styleFrom(
                                    //       primary: Colors.transparent,
                                    //       elevation: 0,
                                    //       padding: EdgeInsets.all(0),
                                    //       shape: RoundedRectangleBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(8 * fem),
                                    //       ),
                                    //     ),
                                    //     child: Container(
                                    //       margin: EdgeInsets.fromLTRB(
                                    //           0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                    //       height: double.infinity,
                                    //       child: Column(
                                    //         crossAxisAlignment:
                                    //             CrossAxisAlignment.center,
                                    //         children: [
                                    //           Container(
                                    //             margin: EdgeInsets.fromLTRB(
                                    //                 0 * fem,
                                    //                 0 * fem,
                                    //                 0 * fem,
                                    //                 8 * fem),
                                    //             width: 40 * fem,
                                    //             height: 40 * fem,
                                    //             decoration: BoxDecoration(
                                    //               color: Color(0xffffffff),
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       12 * fem),
                                    //               boxShadow: [
                                    //                 BoxShadow(
                                    //                   color: Color(0x28000000),
                                    //                   offset: Offset(
                                    //                       0 * fem, 0 * fem),
                                    //                   blurRadius: 8 * fem,
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             child: Image.asset(
                                    //               'assets/images/location-add.png',
                                    //               color: Color(
                                    //                   0xfff95031), // Gantilah dengan warna yang sesuai
                                    //             ),
                                    //           ),
                                    //           Container(
                                    //             constraints: BoxConstraints(
                                    //               maxWidth: 50 * fem,
                                    //             ),
                                    //             child: Text(
                                    //               'Tambah\nAlamat',
                                    //               textAlign: TextAlign.center,
                                    //               style: SafeGoogleFont(
                                    //                 'Plus Jakarta Sans',
                                    //                 fontSize: 12 * ffem,
                                    //                 fontWeight: FontWeight.w400,
                                    //                 height: 1.26 * ffem / fem,
                                    //                 color: Color(0xff626262),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/resendverifikasi');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          elevation: 0,
                                          padding: EdgeInsets.all(0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8 * fem),
                                          ),
                                        ),
                                        child: Container(
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    8 * fem),
                                                width: 40 * fem,
                                                height: 40 * fem,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffffffff),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12 * fem),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x28000000),
                                                      offset: Offset(
                                                          0 * fem, 0 * fem),
                                                      blurRadius: 8 * fem,
                                                    ),
                                                  ],
                                                ),
                                                child: Image.asset(
                                                  'assets/images/send-2.png',
                                                  color: Color(
                                                      0xfff95031), // Gantilah dengan warna yang sesuai
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 64 * fem,
                                                ),
                                                child: Text(
                                                  'Kirim Ulang\nVerifikasi',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Plus Jakarta Sans',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.26 * ffem / fem,
                                                    color: Color(0xff626262),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
