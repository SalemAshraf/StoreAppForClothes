// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, implementation_imports, unused_import, prefer_const_constructors, unused_local_variable, use_build_context_synchronously, non_constant_identifier_names, dead_code, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Admin/AdminHome.dart';
import 'package:store/UserApp/Views/HomeScreen/home_view.dart';
import 'package:store/UserApp/Views/RegisterScreen/register_view.dart';
import 'package:store/UserApp/ViewsModel/LoginScreen/login_view_model.dart';
import 'package:store/Widgets/TextField.dart';
import 'package:store/Widgets/TextWidget.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();

  adminCheck(String? passworduser) {
    if (passworduser == '@Brand1020') {
      return true;
    } else {
      return false;
    }
  }
}

class _LoginPageState extends State<LoginPage> {
  String? emailUser;
  String? passworduser;
  GlobalKey<FormState> formState = GlobalKey();
  bool isLoading = false;

  LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: formState,
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        TextWidget(
                            text: 'Good to see you!',
                            color: Color(0xDD000000),
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold),
                        TextWidget(
                            text: 'Let’s continue the journey.',
                            color: Color(0xFF333333),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: TextFieldWidget(
                            onchanged: (data) {
                              emailUser = data;
                            },
                            text: 'Enter Your Email',
                            color: Color(0xDD000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            onTap: (data) {},
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFieldWidget(
                          onchanged: (data) {
                            passworduser = data;
                          },
                          text: 'Enter Your Password',
                          color: Color(0xDD000000),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          onTap: (data) {},
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextWidget(
                            text: 'or',
                            color: Color(0xDD000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ImageIcon(
                                AssetImage('assets/Group 9.png'),
                                size: 40,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                loginViewModel.signInWIthGoogle();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ImageIcon(
                                  AssetImage('assets/Group 10.png'),
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ImageIcon(
                                AssetImage('assets/Group 11.png'),
                                size: 40,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () async {
                            if (formState.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                await loginViewModel.loginUser(
                                    emailUser!, passworduser!);
                                loginViewModel.snackMethode(
                                    context, 'Welcome Back! Kudos is here.');
                                if (passworduser == '@Brand1020') {
                                  Navigator.of(context)
                                      .pushNamed(AdminDart.routeName);
                                } else {
                                  Navigator.of(context)
                                      .pushNamed(HomeScreen.routeNamed);
                                }
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  loginViewModel.snackMethode(
                                      context, 'No user found for that email.');
                                  isLoading = false;
                                  setState(() {});
                                } else if (e.code == 'wrong-password') {
                                  loginViewModel.snackMethode(context,
                                      'Wrong password provided for that user.');
                                  isLoading = false;
                                  setState(() {});
                                }
                              }
                            }
                            isLoading = false;
                            setState(() {});
                          },
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xFF1E1E1E),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Center(
                                  child: TextWidget(
                                      text: 'Log In',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                                text: 'Don’t have an account?',
                                color: Color(0xFF1E1E1E),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterPage.routeName);
                              },
                              child: TextWidget(
                                  text: '  Create Account',
                                  color: Color(0xFF1E1E1E),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
