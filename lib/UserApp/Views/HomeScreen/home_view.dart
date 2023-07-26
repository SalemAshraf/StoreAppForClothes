// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names, unused_local_variable, unused_import, must_be_immutable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/Admin/AdminHome.dart';
import 'package:store/UserApp/ViewsModel/HomeScreen/home_view_model.dart';
import 'package:store/Widgets/IconButton.dart';
import 'package:store/Widgets/TextField.dart';
import 'package:store/Widgets/productItem.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNamed = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    // Responsive
    var mediaQueryH = MediaQuery.of(context).size.height;
    var mediaQueryW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0XFFE9EBEA),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                /// Search Bar
                padding: EdgeInsets.only(
                    top: mediaQueryH * 0.08,
                    right: mediaQueryW * 0.04,
                    left: mediaQueryW * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          child: TextFieldWidget(
                        text: 'Search Anything..',
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        beforeIcon: Icon(Icons.search),
                        onTap: (data) {},
                      )),
                    ),
                    IconButtonWidget(
                      path: 'assets/icons/basket.png',
                    ),
                    IconButtonWidget(
                      path: 'assets/icons/message.png',
                      onPressed: () async {
                        var auth = FirebaseAuth.instance;
                        await auth.signOut();
                        print('Done');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQueryH * 0.02,
              ),

              /// Header Banner
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: mediaQueryW,
                    height: mediaQueryH * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/clothes.jpg'),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 28),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('#FASHION DAY', style: GoogleFonts.nunito()),
                          Text('80% OFF',
                              style: GoogleFonts.nunito(
                                fontSize: 28,
                              )),
                          Container(
                            width: mediaQueryW * 0.4,
                            child: Text(
                                'Discover fashion that suits to your style.',
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                )),
                          ),
                          SizedBox(
                            height: mediaQueryH * 0.01,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black)),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AdminDart.routeName);
                              },
                              child: Text('Check it'))
                        ],
                      ),
                    ),
                  )
                ],
              ),

              /// Best Sale Container
              Container(
                color: Color(0XFFE9EBEA),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Best Sale Product',
                            style: GoogleFonts.nunito(
                                fontSize: 18, color: Colors.black),
                          ),
                          Text('See more -',
                              style: GoogleFonts.nunito(
                                  fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                      Container(
                          height: mediaQueryH * 0.55,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return ProductItem();
                              })),
                    ],
                  ),
                ),
              ),

              /// New Men's Collection
              Container(
                color: Color(0XFFE9EBEA),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Men\'s Collection',
                            style: GoogleFonts.nunito(
                                fontSize: 18, color: Colors.black),
                          ),
                          Text('See more -',
                              style: GoogleFonts.nunito(
                                  fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                      Container(
                          height: mediaQueryH * 0.55,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return ProductItem();
                              })),
                    ],
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
