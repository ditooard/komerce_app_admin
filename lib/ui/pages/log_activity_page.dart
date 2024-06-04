import 'package:flutter/material.dart';
import 'package:admin_komerce/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:admin_komerce/ui/widgets/dummy.dart';
import 'package:provider/provider.dart';

class MyModel6 with ChangeNotifier {
  bool isFormFilled = false;

  void setFormFilled(bool value) {
    isFormFilled = value;
    notifyListeners();
  }
}

class LogActivity extends StatefulWidget {
  @override
  _LogActivity createState() => _LogActivity();
}

class _LogActivity extends State<LogActivity> {
  DateTime _selectedDateAwal = DateTime.now();
  TextEditingController _dateControllerAwal = TextEditingController();

  DateTime _selectedDateAkhir = DateTime.now();
  TextEditingController _dateControllerAkhir = TextEditingController();
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _dateControllerAwal.text = _formattedDate(_selectedDateAwal);
    _dateControllerAkhir.text = _formattedDate(_selectedDateAkhir);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Setelah widget dibangun sepenuhnya, Anda dapat mengakses context dan melakukan perubahan state.
      Provider.of<MyModel6>(context, listen: false).setFormFilled(false);
    });
  }

  String _formattedDate(DateTime? date) {
    return date != null
        ? '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}'
        : '';
  }

  Future<void> selectDateAwal() async {
    DateTime? selectedDateAwal = await showDatePicker(
      context: context,
      initialDate: _selectedDateAwal,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.orange,
            colorScheme: ColorScheme.light(primary: Colors.orange),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (selectedDateAwal != null) {
      setState(() {
        _selectedDateAwal = selectedDateAwal;
        _dateControllerAwal.text = _formattedDate(_selectedDateAwal);
      });
    }
  }

  Future<void> selectDateAkhir() async {
    DateTime? selectedDateAkhir = await showDatePicker(
      context: context,
      initialDate: _selectedDateAkhir,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.orange,
            colorScheme: ColorScheme.light(primary: Colors.orange),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (selectedDateAkhir != null) {
      setState(() {
        _selectedDateAkhir = selectedDateAkhir;
        _dateControllerAkhir.text = _formattedDate(_selectedDateAkhir);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel6>(context);
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: 700,
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
                          'Log Aktivitas',
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
                  width: 375,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 40,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFE2E2E2)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Cari Nama Admin',
                                          hintStyle: TextStyle(
                                            color: Color(0xFFC2C2C2),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder
                                              .none, // Menghilangkan border bawaan
                                          focusedBorder: InputBorder
                                              .none, // Menghilangkan border saat difokuskan
                                          enabledBorder: InputBorder
                                              .none, // Menghilangkan border saat tidak difokuskan
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                              'assets/images/search-normal.png',
                                              width: 375 * fem,
                                              height: 273 * fem,
                                              color: Colors.black,
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
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return Container(
                                    padding: EdgeInsets.fromLTRB(
                                        24 * fem, 15 * fem, 24 * fem, 32 * fem),
                                    width: 375 * fem,
                                    height: 400 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30 * fem),
                                        topRight: Radius.circular(30 * fem),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(135.5 * fem,
                                              0 * fem, 135.5 * fem, 32 * fem),
                                          width: double.infinity,
                                          height: 6 * fem,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3 * fem),
                                            color: Color(0xffc2c2c2),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 327,
                                          height: 24,
                                          child: Text(
                                            'Filter',
                                            style: TextStyle(
                                              color: Color(0xFF333333),
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        Container(
                                          width: 327,
                                          height: 66,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: SizedBox(
                                                        child: Text(
                                                          'Aktivitas',
                                                          style: TextStyle(
                                                            color:
                                                                Color(0xFF333333),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                width: 327,
                                                height: 40,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14,
                                                        vertical: 10),
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 1,
                                                        color: Color(0xFFE2E2E2)),
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
                                                    Expanded(
                                                      child:
                                                          DropdownButton<String>(
                                                        value: selectedValue,
                                                        hint: Text(
                                                          'Pilih Aktivitas',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        onChanged:
                                                            (String? newValue) {
                                                          setState(() {
                                                            selectedValue =
                                                                newValue;
                                                            myModel.setFormFilled(
                                                                newValue!
                                                                    .isNotEmpty);
                                                          });
                                                        },
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                        isExpanded: true,
                                                        underline: Container(),
                                                        items: <String>[
                                                          'Tambah Alamat',
                                                          'Update No. HP',
                                                          'Kirim Ulang Verifikasi'
                                                        ].map<
                                                                DropdownMenuItem<
                                                                    String>>(
                                                            (String value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 85,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  width: 159.50,
                                                  height: 66,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: SizedBox(
                                                                child: Text(
                                                                  'Awal',
                                                                  style: TextStyle(
                                                                    color: Color(
                                                                        0xFF333333),
                                                                    fontSize: 14,
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              selectDateAwal();
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width:
                                                                  double.infinity,
                                                              height: 40,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 14,
                                                                vertical: 0,
                                                              ),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors.white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                    width: 1,
                                                                    color: Color(
                                                                        0xFFE2E2E2),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center, // Set to CrossAxisAlignment.center
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          _dateControllerAwal,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF333333),
                                                                        fontSize:
                                                                            14,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                      ),
                                                                      enabled:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            InputBorder
                                                                                .none,
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .all(0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      width: 10),
                                                                  Container(
                                                                    width: 24,
                                                                    height: 24,
                                                                    child:
                                                                        Image.asset(
                                                                      'assets/images/calendar.png',
                                                                      width:
                                                                          375 * fem,
                                                                      height:
                                                                          273 * fem,
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
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Flexible(
                                                child: Container(
                                                  width: 159.50,
                                                  height: 66,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: SizedBox(
                                                                child: Text(
                                                                  'Akhir',
                                                                  style: TextStyle(
                                                                    color: Color(
                                                                        0xFF333333),
                                                                    fontSize: 14,
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              selectDateAkhir();
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width:
                                                                  double.infinity,
                                                              height: 40,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 14,
                                                                vertical: 0,
                                                              ),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors.white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                    width: 1,
                                                                    color: Color(
                                                                        0xFFE2E2E2),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50, // Sesuaikan tinggi Container
                                                                      child:
                                                                          TextField(
                                                                        controller:
                                                                            _dateControllerAkhir,
                                                                        style:
                                                                            TextStyle(
                                                                          color: Color(
                                                                              0xFF333333),
                                                                          fontSize:
                                                                              14,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w400,
                                                                        ),
                                                                        enabled:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          border: InputBorder
                                                                              .none,
                                                                          contentPadding:
                                                                              EdgeInsets.all(
                                                                                  0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      width: 10),
                                                                  Container(
                                                                    width: 24,
                                                                    height: 24,
                                                                    child:
                                                                        Image.asset(
                                                                      'assets/images/calendar.png',
                                                                      width:
                                                                          375 * fem,
                                                                      height:
                                                                          273 * fem,
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      // Reset values to their initial state (current date, time set to 00:00:00)
                                                      selectedValue = null;
      
                                                      _selectedDateAwal =
                                                          DateTime.now();
      
                                                      _selectedDateAkhir =
                                                          DateTime.now();
      
                                                      _dateControllerAwal.text =
                                                          DateFormat('dd/MM/yyyy')
                                                              .format(
                                                                  DateTime.now());
                                                      _dateControllerAkhir.text =
                                                          DateFormat('dd/MM/yyyy')
                                                              .format(
                                                                  DateTime.now());
                                                      Provider.of<MyModel6>(
                                                              context,
                                                              listen: false)
                                                          .setFormFilled(false);
                                                    });
      
                                                    print('$selectedValue');
                                                    print('$_dateControllerAwal');
                                                    print(
                                                        '$_dateControllerAkhir');
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 14),
                                                    primary: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1,
                                                          color:
                                                              Color(0xFFF95031)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Reset',
                                                    style: TextStyle(
                                                      color: Color(0xFFF95031),
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.w600,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: myModel.isFormFilled
                                                      ? () {
                                                          if (selectedValue !=
                                                                  null &&
                                                              _selectedDateAwal !=
                                                                  null &&
                                                              _selectedDateAkhir !=
                                                                  null) {
                                                            print(
                                                                'Aktivitas: $selectedValue');
                                                            print(
                                                                'Tanggal Awal: $_selectedDateAwal');
                                                            print(
                                                                'Tanggal Akhir: $_selectedDateAkhir');
                                                          } else {
                                                            print('No activity');
                                                          }
                                                          Navigator.of(context)
                                                              .pop();
                                                        }
                                                      : null,
                                                  style: ElevatedButton.styleFrom(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 14),
                                                    primary: myModel.isFormFilled
                                                        ? Color(0xffF95031)
                                                        : Colors.grey,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Terapkan',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 0,
                                                        ),
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
                                  );
                                });
                              },
                            );
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            child: Image.asset(
                              'assets/images/filter-square.png',
                              width: 375 * fem,
                              height: 273 * fem,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Flexible(
                  child: Container(
                    width: 375,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dummyData.length,
                            itemBuilder: (BuildContext context, int index) {
                              var containerData = dummyData[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFF4F4F4),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      padding: const EdgeInsets.all(8),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x19000000),
                                            blurRadius: 15,
                                            offset: Offset(0, 0),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        containerData['imagePath'] ?? '',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                containerData['title'] ?? '',
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 14,
                                                  fontFamily: 'Plus Jakarta Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                containerData['date'] ?? '',
                                                style: TextStyle(
                                                  color: Color(0xFF818181),
                                                  fontSize: 10,
                                                  fontFamily: 'Plus Jakarta Sans',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            containerData['activity'] ?? '',
                                            style: TextStyle(
                                              color: Color(0xFF818181),
                                              fontSize: 12,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            containerData['admin'] ?? '',
                                            style: TextStyle(
                                              color: Color(0xFFF95031),
                                              fontSize: 12,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
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
      ),
    ));
  }
}
