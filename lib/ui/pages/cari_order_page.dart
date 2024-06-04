import 'package:flutter/material.dart';
import 'package:admin_komerce/shared/theme.dart';
import 'package:admin_komerce/ui/pages/detail_order_page.dart';
import 'package:admin_komerce/services/order_service.dart';
import 'package:admin_komerce/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

class MyModel2 with ChangeNotifier {
  bool isFormFilled = false;

  void setFormFilled(bool value) {
    isFormFilled = value;
    notifyListeners();
  }
}

class CariOrder extends StatefulWidget {
  @override
  _CariOrder createState() => _CariOrder();
}

class _CariOrder extends State<CariOrder> {
  final TextEditingController _orderNumberController = TextEditingController();
  final OrderService _orderService = OrderService();
  String _result = '';

  bool isLoading = false; // Tambahkan variabel isLoading.
  OverlayEntry? loadingOverlay;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Setelah widget dibangun sepenuhnya, Anda dapat mengakses context dan melakukan perubahan state.
      Provider.of<MyModel2>(context, listen: false).setFormFilled(false);
    });
  }

  Future<void> _showAlertDialog(
      BuildContext context, String title, String message) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
            width: 247 * fem,
            height: 105 * fem,
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
                    'assets/images/failed-icon.png',
                    width: 58.8 * fem,
                    height: 55.2 * fem,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 197 * fem,
                  ),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Plus Jakarta Sans',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.26 * ffem / fem,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                height: 40 * fem,
                decoration: BoxDecoration(
                  color: Color(0xfff95031),
                  borderRadius: BorderRadius.circular(8 * fem),
                ),
                child: Center(
                  child: Text(
                    'Oke',
                    style: SafeGoogleFont(
                      'Plus Jakarta Sans',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.26 * ffem / fem,
                      color: Color(0xffffffff),
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

  OverlayEntry createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy,
        width: size.width,
        height: size.height,
        child: LoadingScreen(),
      ),
    );
  }

  Future<void> _fetchOrderDetails() async {
    final orderNumber = _orderNumberController.text.trim();
    if (orderNumber.isEmpty) {
      _showAlertDialog(context, 'Nomor Resi Belum Diisi',
          'Silakan isi nomor resi terlebih dahulu!');
      return;
    }

    setState(() {
      loadingOverlay = createOverlayEntry();
      Overlay.of(context)?.insert(loadingOverlay!);
    });

    try {
      final orderData = await _orderService.getOrderDetails(orderNumber);
      if (orderData != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailOrder(orderNumber: orderNumber),
          ),
        );
      } else {
        _showAlertDialog(
          context,
          'Kesalahan Server',
          'Terjadi kesalahan pada server. Silakan coba lagi nanti.',
        );
      }
    } catch (e) {
      // Penanganan kesalahan terkait dengan komunikasi jaringan atau lainnya
      _showAlertDialog(context, 'Data Pemesanan Tidak Ditemukan',
          'Order data tidak ditemukan');
    } finally {
      // Hapus loadingOverlay setelah selesai
      if (loadingOverlay != null) {
        loadingOverlay!.remove();
      }

      setState(() {
        _orderService.isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel2>(context);

    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
          'Cari Order',
          style: TextStyle(
            color: Colors.black, // Ubah warna teks
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
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              if (_orderService.isLoading)
                createOverlayEntry().builder(
                    context), // Tampilkan widget LoadingScreen jika isLoading true
              if (!_orderService.isLoading)
                ElevatedButton(
                  onPressed: myModel.isFormFilled
                      ? () {
                          _fetchOrderDetails();
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
                      'Cari Order',
                      style: TextStyle(
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
            ],
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
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  height: 100 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 32 * fem,
                        child: Column(
                          children: [
                            Text(
                              'Masukan Nomor Resi',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 32 * fem,
                        top: 20 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              12 * fem, 10 * fem, 12 * fem, 10 * fem),
                          width: 311 * fem,
                          height: 44 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(
                                    0xffcccccc)), // Tambahkan border di sini
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          myModel
                                              .setFormFilled(value.isNotEmpty);
                                        });
                                      },
                                      controller: _orderNumberController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 9 * fem,
                                          top: 7 * fem,
                                          right: 9 * fem,
                                          bottom: 7 * fem,
                                        ),
                                        hintText: 'KOMSHIP123XXX',
                                        hintStyle: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.26 * ffem / fem,
                                          color: Color(0xffb3b3b3),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
