// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, unused_import, must_be_immutable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDart extends StatelessWidget {
  static const String routeName = 'AdminDart';

  @override
  Widget build(BuildContext context) {
    var mediaQueryH = MediaQuery.of(context).size.height;
    var mediaQueryW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.account_balance_wallet),
                  Text('  Your Earnings',
                      style: GoogleFonts.nunito(fontSize: 18)),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(16)),
                height: 150,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                              ),
                              Text('  earnings',
                                  style: GoogleFonts.nunito(
                                      color: Colors.white, fontSize: 18)),
                            ],
                          ),
                          Text('1054 Dollar',
                                  style: GoogleFonts.nunito(
                                      color: Colors.white, fontSize: 18)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: mediaQueryW * 0.42,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(16)),
                    height: 150,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: mediaQueryW * 0.42,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(16)),
                    height: 150,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: mediaQueryW * 0.42,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(16)),
                    height: 150,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: mediaQueryW * 0.42,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(16)),
                    height: 150,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(16)),
                height: mediaQueryH,
                width: mediaQueryW,
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
