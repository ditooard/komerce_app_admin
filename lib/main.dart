import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:admin_komerce/ui/pages/cari_order_page.dart';
import 'package:admin_komerce/ui/pages/detail_order_page.dart';
import 'package:admin_komerce/ui/pages/log_activity_page.dart';
import 'package:admin_komerce/ui/pages/resend_verifikasi_page.dart';
import 'package:admin_komerce/ui/pages/splash_page.dart';
import 'package:admin_komerce/ui/pages/login_page.dart';
import 'package:admin_komerce/ui/pages/lupa_password_page.dart';
import 'package:admin_komerce/ui/pages/profile_page.dart';
import 'package:admin_komerce/ui/pages/detail_profile_page.dart';
import 'package:admin_komerce/ui/pages/home_page.dart';
import 'package:admin_komerce/ui/pages/tambah_alamat_page.dart';
import 'package:admin_komerce/ui/pages/ubah_password_page.dart';
import 'package:admin_komerce/ui/pages/landing_page.dart';
import 'dart:io';
import 'package:admin_komerce/ui/pages/update_noHp_page1.dart';
import 'package:admin_komerce/ui/pages/update_noHp_page2.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  debugPaintSizeEnabled = false;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xffF95031), // Warna navigation bar
    statusBarColor: Color(0xffF95031), // Warna status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyModel()),
        ChangeNotifierProvider(create: (context) => MyModel2()),
        ChangeNotifierProvider(create: (context) => MyModel3()),
        ChangeNotifierProvider(create: (context) => MyModel4()),
        ChangeNotifierProvider(create: (context) => MyModel5()),
        ChangeNotifierProvider(create: (context) => MyModel6()),
      ],
      child: MaterialApp(
        title: 'Komerce APP Admin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'PlusJakartaSans',
            primarySwatch: MaterialColor(0xffF95031, {
              50: Color(0xffF95031),
              100: Color(0xffF95031),
              200: Color(0xffF95031),
              300: Color(0xffF95031),
              400: Color(0xffF95031),
              500: Color(0xffF95031),
              600: Color(0xffF95031),
              700: Color(0xffF95031),
              800: Color(0xffF95031),
              900: Color(0xffF95031),
            })),
        home: SplashPage(),
        initialRoute: '/splash',
        routes: {
          '/landing': (context) => LandingPage(),
          '/splash': (context) => SplashPage(),
          '/login': (context) => Login(),
          '/lupapassword': (context) => LupaPassword(),
          '/profile': (context) => Profile(),
          '/detailprofile': (context) => DetailProfile(),
          '/home': (context) => HomePage(),
          '/ubahpassword': (context) => ChangePasswordPage(),
          '/cariorder': (context) => CariOrder(),
          '/detailorder': (context) => DetailOrder(
                orderNumber: '',
              ),
          '/updatenohp1': (context) => UpdateNoHp1(),
          '/updatenohp2': (context) => UpdateNoHp2(),
          '/resendverifikasi': (context) => ResendVerifikasi(),
          '/tambahalamat': (context) => TambahAlamat(),
        },
      ),
    );
  }
}
