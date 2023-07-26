// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, implementation_imports, unused_import, prefer_const_constructors, unused_local_variable, use_build_context_synchronously, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/UserApp/ViewsModel/RegisterScreen/register_view_model.dart';
import 'package:store/Widgets/TextField.dart';
import 'package:store/Widgets/TextWidget.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? emailUser;
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? mobileNumber;

  String? passworduser;

  GlobalKey<FormState> formState = GlobalKey();
  RegisterViewModel registerViewModel = RegisterViewModel();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: formState,
            child: ListView(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      TextWidget(
                          text: 'Welcome!',
                          color: Color(0xDD000000),
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                      TextWidget(
                          text: 'Sign up to get started.',
                          color: Color(0xFF333333),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: TextFieldWidget(
                            onTap: (data) {
                              userName = data;
                            },
                            text: 'Enter Your Username',
                            color: Color(0xDD000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWidget(
                          onTap: (data) {
                            firstName = data;
                          },
                          text: 'Enter Your First Name',
                          color: Color(0xDD000000),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWidget(
                          onTap: (data) {
                            lastName = data;
                          },
                          text: 'Enter Your Last Name',
                          color: Color(0xDD000000),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWidget(
                        onchanged: (data) {
                          emailUser = data;
                        },
                        text: 'Enter Your Email',
                        color: Color(0xDD000000),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        onTap: (data) {},
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
                      TextFieldWidget(
                          onTap: (data) {
                            mobileNumber = data;
                          },
                          text: 'Enter Your Mobile Phone',
                          color: Color(0xDD000000),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
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
                              GoogleSignIn().signIn();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ImageIcon(
                                AssetImage('assets/Group 10.png'),
                                size: 40,
                                color: Colors.orange,
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
                              await registerViewModel.registerUser(
                                  emailUser!, passworduser!);
                              registerViewModel.snackMethode(context,
                                  'Congratulations 🎉 Your Account is Ready');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                registerViewModel.snackMethode(
                                    context, 'Weak Password. Please Try Again');
                                isLoading = false;
                                setState(() {});
                              } else if (e.code == 'email-already-in-use') {
                                registerViewModel.snackMethode(context,
                                    'Email Already Used. Please Log In');
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
                                    text: 'Sign Up',
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
                              text: 'Already have an account?',
                              color: Color(0xFF1E1E1E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: TextWidget(
                                text: '  Log In',
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
            ]),
          ),
        ),
      ),
    );
  }
}
