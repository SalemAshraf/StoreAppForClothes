// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, unused_import, must_be_immutable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/UserApp/Views/ProductDetails/productDetails_view.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQueryH = MediaQuery.of(context).size.height;
    var mediaQueryW = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetails.routeNamed);
      },
      child: Container(
        padding: EdgeInsets.only(top: 16, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/6917468251_6_1_1.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  width: 200,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('overshirt',
                          style: GoogleFonts.nunito(
                              fontSize: 14, color: Colors.black54)),
                      Text('OVERSHIRT WITH CONTRAST TOPSTITCHING',
                          style: GoogleFonts.nunito(
                              fontSize: 16, color: Colors.black)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/star.png',
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text('   4.9  |  2503',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12, color: Colors.black54)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text('        \$53.9',
                                  style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 10, 101, 55))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
