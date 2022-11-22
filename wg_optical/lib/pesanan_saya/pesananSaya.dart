// ignore_for_file: unnecessary_import, implementation_imports, duplicate_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wg_optical/pesanan_saya/slideFramePesanan/Kirim.dart';
import 'package:wg_optical/pesanan_saya/slideFramePesanan/Produksi.dart';
import 'package:wg_optical/pesanan_saya/slideFramePesanan/Selesai.dart';

class pesananSaya extends StatefulWidget {
  const pesananSaya({super.key});

  @override
  State<pesananSaya> createState() => _pesananSayaState();
}

class _pesananSayaState extends State<pesananSaya>
    with TickerProviderStateMixin {
  int counter = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Produksi(),
    Kirim(),
    Selesai()
  ];
  var anu = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: AppBar(
        backgroundColor: Color(0xfff0f0f0),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 110,
                  width: screenWidth,
                  // color: Colors.amber,
                ),
                Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: Container(
                      color: Colors.transparent,
                      // height: 50.0,
                      width: screenWidth - 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              "Pesanan Saya",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 35.0,
                              width: 35.0,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.transparent, width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.transparent,
                                size: 20.0,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 35.0,
                              width: 35.0,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.transparent, width: 1.0),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Icon(
                                Icons.favorite_rounded,
                                color: Colors.transparent,
                                size: 17.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: screenWidth - 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSizeButton('DiProduksi', 0),
                _buildSizeButton('Dikirim', 1),
                _buildSizeButton('Selesai', 2)
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black38,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: _widgetOptions.elementAt(counter),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeButton(String title, int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 4),
      curve: Curves.easeIn,
      child: GestureDetector(
        onTap: () {
          setState(() {
            counter = index;
          });
          print(index);
        },
        child: Container(
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
