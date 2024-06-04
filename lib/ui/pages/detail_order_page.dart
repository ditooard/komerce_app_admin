import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin_komerce/services/order_service.dart';
import 'package:admin_komerce/shared/theme.dart';
import 'package:flutter/cupertino.dart';

import '../../models/order_model.dart';

class DetailOrder extends StatefulWidget {
  final String orderNumber;

  DetailOrder({required this.orderNumber}) {}

  @override
  _DetailOrder createState() => _DetailOrder();
}

class _DetailOrder extends State<DetailOrder> {
  Future<void> _refreshData() async {
    // Logika pembaruan data disini
    await Future.delayed(Duration(seconds: 2));
  }

  List<Product> products = [];

  final OrderService orderService = OrderService();

  String partnerName = '';
  String custPhone = '';
  String orderDate = '';
  String shipping = '';
  String orderNo = '';
  String payMethod = '';
  String noOrder = '';
  String custName = '';
  String custAddress = '';
  int totalWeight = 0;
  int totalPrice = 0;
  int ongkir = 0;
  int additionalCost = 0;
  int discount = 0;
  int totalPay = 0;

  Future<void> fetchData() async {
    try {
      // Panggil metode getOrderDetails dengan nomor pesanan dari widget
      Map<String, dynamic>? orderData =
          await orderService.getOrderDetails(widget.orderNumber!);

      setState(() {
        partnerName = orderData['data']['user_fullname'];
        custPhone = orderData['data']['customer_phone'];
        orderNo = orderData['data']['order_no'];
        shipping = orderData['data']['shipment_image_path'];
        orderDate = orderData['data']['order_date'];
        payMethod = orderData['data']['payment_method'];
        noOrder = orderData['data']['order_no'];
        custName = orderData['data']['customer_name'];
        custAddress = orderData['data']['customer_address'];
        totalWeight = orderData['data']['total_weight'];
        totalPrice = orderData['data']['grandtotal'];
        ongkir = orderData['data']['shipping_cost'];
        additionalCost = orderData['data']['additional_cost'];
        discount = orderData['data']['discount'];
        totalPay = orderData['data']['subtotal'];

        final List<dynamic> productData = orderData['data']['product'];
        products = productData.map((item) {
          return Product.fromJson(item);
        }).toList();
      });
    } catch (e) {
      // Tangani kesalahan jika terjadi
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              12 * fem, 20 * fem, 16.71 * fem, 15 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    12 * fem, 0 * fem, 181.29 * fem, 23 * fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 10 * fem, 1 * fem),
                                        width: 24 * fem,
                                        height: 24 * fem,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Detail Order',
                                      style: SafeGoogleFont(
                                        'Plus Jakarta Sans',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.26 * ffem / fem,
                                        color: Color(0xff222222),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    12 * fem, 0 * fem, 7.29 * fem, 14 * fem),
                                padding: EdgeInsets.fromLTRB(
                                    12 * fem, 11.5 * fem, 12 * fem, 11 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x28000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 8 * fem,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 11.5 * fem),
                                      child: Text(
                                        'Data Partner',
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.26 * ffem / fem,
                                          letterSpacing: 0.1000000015 * fem,
                                          color: Color(0xff222222),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 252 * fem,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 0 * fem),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      38 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    'Nama Partner',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  partnerName,
                                                  style: SafeGoogleFont(
                                                    'Plus Jakarta Sans',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.26 * ffem / fem,
                                                    color: Color(0xff333333),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7 * fem,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      84 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    'Email',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  partnerName,
                                                  style: SafeGoogleFont(
                                                    'Plus Jakarta Sans',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.26 * ffem / fem,
                                                    color: Color(0xff333333),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7 * fem,
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 21 * fem, 0 * fem),
                                            width: double.infinity,
                                            height: 16 * fem,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      25 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    'No. Handphone',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0.03 * fem,
                                                      0 * fem),
                                                  height: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                4.03 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          custPhone,
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                0 * fem,
                                                                1 * fem),
                                                        width: 11.94 * fem,
                                                        height: 12 * fem,
                                                        child: Image.asset(
                                                          'assets/images/Whatsapp.png',
                                                          width: 11.94 * fem,
                                                          height: 12 * fem,
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
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    12 * fem, 0 * fem, 7.29 * fem, 16 * fem),
                                padding: EdgeInsets.fromLTRB(
                                    8 * fem, 12 * fem, 8 * fem, 11.5 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffdff3ff),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.5 * fem, 110 * fem, 0 * fem),
                                      child: Text(
                                        'No. Resi',
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.26 * ffem / fem,
                                          color: Color(0xff333333),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Ambil dan salin teks dari widget Text ke clipboard
                                        final textToCopy = '$noOrder';
                                        Clipboard.setData(
                                            ClipboardData(text: textToCopy));
                                        // Tampilkan pesan bahwa teks telah disalin
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Teks telah disalin ke clipboard: $textToCopy'),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0.5 * fem, 4 * fem, 0 * fem),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            noOrder,
                                            textAlign: TextAlign.right,
                                            style: SafeGoogleFont(
                                              'Plus Jakarta Sans',
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.26 * ffem / fem,
                                              color: Color(0xff333333),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 0.5 * fem),
                                      width: 16 * fem,
                                      height: 16 * fem,
                                      child: Icon(
                                        Icons.file_copy_outlined,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    12 * fem, 0 * fem, 7.29 * fem, 0 * fem),
                                padding: EdgeInsets.fromLTRB(
                                    12 * fem, 11.5 * fem, 12 * fem, 11 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x28000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 8 * fem,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 11.5 * fem),
                                      child: Text(
                                        'Rincian Order',
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.26 * ffem / fem,
                                          letterSpacing: 0.1000000015 * fem,
                                          color: Color(0xff222222),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0 * fem,
                                                0 * fem,
                                                0 * fem,
                                                7 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      10 * fem,
                                                      7 * fem),
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                68 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          'Pembeli',
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        custName,
                                                        style: SafeGoogleFont(
                                                          'Plus Jakarta Sans',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height:
                                                              1.26 * ffem / fem,
                                                          color:
                                                              Color(0xff333333),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      7 * fem),
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                42 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          'Waktu Order',
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        orderDate,
                                                        style: SafeGoogleFont(
                                                          'Plus Jakarta Sans',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height:
                                                              1.26 * ffem / fem,
                                                          color:
                                                              Color(0xff333333),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      10 * fem,
                                                      7 * fem),
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                58 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          'No. Order',
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        noOrder,
                                                        style: SafeGoogleFont(
                                                          'Plus Jakarta Sans',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height:
                                                              1.26 * ffem / fem,
                                                          color:
                                                              Color(0xff333333),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      35 * fem,
                                                      5 * fem),
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                37 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          'Alamat Tujuan',
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 153 * fem,
                                                        ),
                                                        child: Text(
                                                          custAddress,
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      6 * fem),
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                2 * fem,
                                                                48 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          'Pengiriman',
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Image.network(
                                                          shipping,
                                                          width: 30 * fem,
                                                          height: 25 * fem,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      159 * fem,
                                                      7 * fem),
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                51 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          'Pengiriman',
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        payMethod,
                                                        style: SafeGoogleFont(
                                                          'Plus Jakarta Sans',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height:
                                                              1.26 * ffem / fem,
                                                          color:
                                                              Color(0xff333333),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      151 * fem,
                                                      0 * fem),
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                54 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          'Berat Total',
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '$totalWeight gr',
                                                        style: SafeGoogleFont(
                                                          'Plus Jakarta Sans',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height:
                                                              1.26 * ffem / fem,
                                                          color:
                                                              Color(0xff333333),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 7 * fem),
                                            width: double.infinity,
                                            height: 1 * fem,
                                            decoration: BoxDecoration(
                                              color: Color(0xffe2e2e2),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 7 * fem),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      126 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    'Total Harga Barang',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Rp. $totalPrice',
                                                    textAlign: TextAlign.right,
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 7 * fem),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      126 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    'Ongkir',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Rp. $ongkir',
                                                    textAlign: TextAlign.right,
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 7 * fem),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      141 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    'Potongan Harga',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '-Rp. $discount',
                                                    textAlign: TextAlign.right,
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xffe31a1a),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 7 * fem),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      185 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    'Biaya Lain',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Rp. $additionalCost',
                                                    textAlign: TextAlign.right,
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      95 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    'Total Pembayaran',
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Rp. $totalPay',
                                                    textAlign: TextAlign.right,
                                                    style: SafeGoogleFont(
                                                      'Plus Jakarta Sans',
                                                      fontSize: 16 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.26 * ffem / fem,
                                                      color: Color(0xff34a770),
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
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 10 * fem),
                          padding: EdgeInsets.fromLTRB(
                              24 * fem, 23.5 * fem, 24 * fem, 23.5 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Color(0xffc2c2c2)),
                            ),
                          ),
                          child: Text(
                            'Rincian Pesanan',
                            style: SafeGoogleFont(
                              'Plus Jakarta Sans',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.26 * ffem / fem,
                              letterSpacing: 0.1000000015 * fem,
                              color: Color(0xff222222),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * fem,
                          child: Stack(
                            children: [
                              ListView.builder(
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    final product = products[index];
                                    return Positioned(
                                      left: 24 * fem,
                                      top: 10 * fem,
                                      child: Container(
                                        width: 327 * fem,
                                        height: 469 * fem,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  16 * fem,
                                                  16 * fem,
                                                  16 * fem,
                                                  16 * fem),
                                              width: double.infinity,
                                              height: 143 * fem,
                                              decoration: BoxDecoration(
                                                color: Color(0xffffffff),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8 * fem),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x28000000),
                                                    offset: Offset(
                                                        0 * fem, 0 * fem),
                                                    blurRadius: 8 * fem,
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        104 * fem,
                                                        7 * fem),
                                                    width: double.infinity,
                                                    height: 67 * fem,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  12 * fem,
                                                                  0 * fem),
                                                          width: 66 * fem,
                                                          height: 66 * fem,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8 * fem),
                                                            color: Color(
                                                                0xffd9d9d9),
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  NetworkImage(
                                                                product
                                                                    .productImage,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                product
                                                                    .productName,
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Plus Jakarta Sans',
                                                                  fontSize:
                                                                      16 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.26 *
                                                                      ffem /
                                                                      fem,
                                                                  color: Color(
                                                                      0xff000000),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 7 * fem,
                                                              ),
                                                              Text(
                                                                product
                                                                    .variantName,
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
                                                                      0xff000000),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 7 * fem,
                                                              ),
                                                              Text(
                                                                '${product.qty.toString()} x Rp${product.price.toString()}',
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
                                                                      0xff000000),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  3 * fem),
                                                          child: Text(
                                                            'Total Harga',
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
                                                                  0xff818181),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Rp${product.price.toString()}',
                                                          style: SafeGoogleFont(
                                                            'Plus Jakarta Sans',
                                                            fontSize: 14 * ffem,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20 * fem,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0 * fem,
                bottom:
                    0, // Adjust this value to control the distance from the bottom
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      24 * fem, 12 * fem, 24 * fem, 24 * fem),
                  width: 375 * fem,
                  height: 86 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        offset: Offset(0 * fem,
                            4 * fem), // Adjust the offset to control the shadow
                        blurRadius: 7 * fem,
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
                          width: 50 * fem,
                          height: 50 * fem,
                          child: Image.asset(
                            'assets/images/More-Button.png',
                            width: 50 * fem,
                            height: 50 * fem,
                          ),
                        ),
                        Container(
                          width: 269 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xfff94f31),
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Check Update',
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
