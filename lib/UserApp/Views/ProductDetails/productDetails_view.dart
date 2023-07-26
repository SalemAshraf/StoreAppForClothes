// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, unused_import, must_be_immutable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/Widgets/IconButton.dart';

class ProductDetails extends StatelessWidget {
  static const String routeNamed = 'ProductDetails';

  @override
  Widget build(BuildContext context) {
    var mediaQueryH = MediaQuery.of(context).size.height;
    var mediaQueryW = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0XFFE9EBEA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          actions: [
            IconButtonWidget(
              path: 'assets/icons/heart.png',
              width: 24,
            ),
            IconButtonWidget(
              path: 'assets/icons/share.png',
              width: 24,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: mediaQueryW * 0.8,
                      height: mediaQueryH * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/6917468251_6_1_1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: mediaQueryH * 0.25, left: 34, right: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 16,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 16,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: mediaQueryW * 0.2,
                      height: mediaQueryH * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: mediaQueryW * 0.2,
                      height: mediaQueryH * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/2.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: mediaQueryW * 0.2,
                      height: mediaQueryH * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/3.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: mediaQueryW * 0.2,
                      height: mediaQueryH * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/4.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('overshirt',
                          style: GoogleFonts.nunito(
                              fontSize: 14, color: Colors.black54)),
                      Text('OVERSHIRT WITH CONTRAST TOPSTITCHING',
                          style: GoogleFonts.nunito(
                              fontSize: 24, color: Colors.black)),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/star.png',
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text('   4.9 Ratings   |   +2903 Reviews',
                                  style: GoogleFonts.nunito(
                                      fontSize: 12, color: Colors.black54)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            'Relaxed fit collared overshirt featuring long sleeves with buttoned cuffs. Patch pockets with flaps on the chest. Contrast seams all over the garment. Buttoned front.',
                            style: GoogleFonts.nunito(
                                fontSize: 16, color: Colors.black)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Price',
                                    style: GoogleFonts.nunito(
                                        fontSize: 12, color: Colors.black87)),
                                Text('\$53.9',
                                    style: GoogleFonts.nunito(
                                        fontSize: 28,
                                        color:
                                            Color.fromARGB(255, 10, 101, 55))),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: mediaQueryW * 0.25,
                                  height: mediaQueryH * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)),
                                    color: Color.fromARGB(255, 10, 101, 55),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButtonWidget(
                                        path: 'assets/icons/basket.png',
                                        width: 20,
                                        color: Colors.white,
                                      ),
                                      Text('1',
                                          style: GoogleFonts.nunito(
                                              fontSize: 12,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: mediaQueryW * 0.25,
                                  height: mediaQueryH * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Buy Now',
                                          style: GoogleFonts.nunito(
                                              fontSize: 12,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
// 