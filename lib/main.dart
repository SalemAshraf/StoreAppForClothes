// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, unrelated_type_equality_checks, await_only_futures, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/Admin/AdminHome.dart';
import 'package:store/UserApp/Model/firebase_options.dart';
import 'package:store/UserApp/Views/HomeScreen/home_view.dart';
import 'package:store/UserApp/Views/LoginScreen/login_view.dart';
import 'package:store/UserApp/Views/ProductDetails/productDetails_view.dart';
import 'package:store/UserApp/Views/RegisterScreen/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  getuid() async {
    var user = await FirebaseAuth.instance.currentUser!.uid;
  }

  LoginPage loginPage = LoginPage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeNamed: (context) => HomeScreen(),
          AdminDart.routeName: (context) => AdminDart(),
          LoginPage.routeName: (context) => LoginPage(),
          RegisterPage.routeName: (context) => RegisterPage(),
          ProductDetails.routeNamed: (context) => ProductDetails()
        },
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (User == 'lEZyxrJLHOO3HjILIBiKeWkTnL83') {
                return AdminDart();
              } else if (snapshot.hasData &&
                  User != 'lEZyxrJLHOO3HjILIBiKeWkTnL83') {
                return HomeScreen();
              } else {
                return LoginPage();
              }
            }));
  }
}
