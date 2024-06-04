import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../services/update_noHp_service.dart';
import '../../shared/theme.dart';

class MyModel3 with ChangeNotifier {
  bool isFormFilled = false;

  void setFormFilled(bool value) {
    isFormFilled = value;
    notifyListeners();
  }
}

class UpdateNoHp1 extends StatefulWidget {
  const UpdateNoHp1({super.key});

  @override
  State<UpdateNoHp1> createState() => _UpdateNoHp1State();
}

class _UpdateNoHp1State extends State<UpdateNoHp1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  UpdateNoHp1 _updateNoHp1 = UpdateNoHp1();
  bool isLoading = false;
  String? token;

  @override
  void initState() {
    super.initState();
    loadToken();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Setelah widget dibangun sepenuhnya, Anda dapat mengakses context dan melakukan perubahan state.
      Provider.of<MyModel3>(context, listen: false).setFormFilled(false);
    });
  }
  

  @override
  void dispose() {
    super.dispose();
    // Anda bisa tetap memanggil super.dispose() di sini.
    // Tidak perlu melakukan aksi lain yang melibatkan context di sini.
  }

  Future<void> loadToken() async {
    token = await getToken();
  }

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel3>(context);
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
        backgroundColor: Colors.white,
        title: Text(
          'Update No. Hp',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.fromLTRB(24 * fem, 12 * fem, 24 * fem, 30 * fem),
          width: double.infinity,
         height: 90 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: myModel.isFormFilled
                      ? () {
                          setState(() {
                            isLoading = true;
                          });

                          String enteredText = _emailController.text;
                          print('Teks yang diinputkan: $enteredText');
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            final tokenValue = token ?? "";

                            // Menunda indikator loading selama 2 detik sebelum memulai pencarian
                            Future.delayed(Duration(seconds: 3), () {
                              fetchUserProfile(
                                      _emailController.text, tokenValue)
                                  .then((result) {
                                setState(() {
                                  isLoading = false;
                                });

                                if (result.email == _emailController.text) {
                                  Navigator.pushNamed(context, '/updatenohp2');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Email does not match API data'),
                                    ),
                                  );
                                }
                              }).catchError((error) {
                                setState(() {
                                  isLoading = false;
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('$error'),
                                  ),
                                );
                              });
                            });
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary:
                        myModel.isFormFilled ? Color(0xffF95031) : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 0 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Lanjutkan',
                      style: TextStyle(
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
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
                        24 * fem, 37 * fem, 24 * fem, 180 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              39 * fem, 0 * fem, 39 * fem, 52 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 11 * fem),
                                child: Text(
                                  'Masukkan Email',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 249 * fem,
                                ),
                                child: Text(
                                  'Silahkan isi email telah terdaftar',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff818181),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              1.28 * fem, 0 * fem, 0 * fem, 30 * fem),
                          width: 236.28 * fem,
                          height: 217.69 * fem,
                          child: Image.asset(
                            'assets/images/emailverif.png',
                            width: 236.28 * fem,
                            height: 217.69 * fem,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 48 * fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                10 * fem, 16.5 * fem, 10 * fem, 15.5 * fem),
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffc2c2c2)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(8 * fem),
                            ),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    myModel.setFormFilled(value.isNotEmpty);
                                  });
                                },
                                controller: _emailController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(9 * fem),
                                  hintText: 'arieff****1@gmail.com',
                                  hintStyle: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xffc2c2c2),
                                  ),
                                  border: InputBorder.none,
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
          ),
        ),
      ),
    );
  }
}
