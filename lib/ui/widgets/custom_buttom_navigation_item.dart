import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin_komerce/ui/pages/log_activity_page.dart';
import 'package:admin_komerce/ui/pages/home_page.dart';
import 'package:admin_komerce/ui/pages/profile_page.dart';
import 'package:admin_komerce/ui/pages/ubah_password_page.dart';

class CustomBottomNavigationItem extends StatefulWidget {
  const CustomBottomNavigationItem({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationItemState createState() =>
      _CustomBottomNavigationItemState();
}

class _CustomBottomNavigationItemState
    extends State<CustomBottomNavigationItem> {
  int _currentIndex = 0; // Indeks halaman aktif

  // Daftar halaman yang akan ditampilkan pada navigasi
  final List<Widget> _pages = [
    HomePage(),
    LogActivity(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Tampilkan halaman sesuai dengan indeks
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: _currentIndex == 0
              ? Color(0xfff95031) // Warna latar belakang saat item Beranda terpilih
              : Color(0xff828282), // Warna latar belakang saat item lain terpilih
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Warna bayangan
              blurRadius: 22.0, // Ukuran blur bayangan
              spreadRadius: 0.0, // Jarak penyebaran bayangan
              offset: Offset(0, -6), // Posisi bayangan (di atas)
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/home.png', // Gantilah dengan path gambar ikon Beranda
                color: _currentIndex == 0
                    ? Color(0xfff95031) // Warna ikon saat item Beranda terpilih
                    : Color(0xff828282), // Warna ikon saat item lain terpilih
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Icon-Log.png', // Gantilah dengan path gambar ikon Log Aktivitas
                color: _currentIndex == 1
                    ? Color(0xfff95031) // Warna ikon saat item Log Aktivitas terpilih
                    : Color(0xff828282), // Warna ikon saat item lain terpilih
              ),
              label: 'Log Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile-circle.png', // Gantilah dengan path gambar ikon Profile
                color: _currentIndex == 2
                    ? Color(0xfff95031) // Warna ikon saat item Profile terpilih
                    : Color(0xff828282), // Warna ikon saat item lain terpilih
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentIndex, // Atur indeks halaman aktif
          selectedItemColor: Color(0xfff95031), // Warna saat item terpilih (aktif)
          unselectedItemColor: Color(0xff828282), // Warna saat item tidak terpilih (tidak aktif)
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Perbarui indeks halaman aktif
            });
          },
        ),
      ),
    );
  }
}

