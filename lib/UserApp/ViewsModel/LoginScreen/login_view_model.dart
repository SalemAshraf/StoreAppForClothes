// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel {
  void snackMethode(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Color(0xFF1E1E1E),
      behavior: SnackBarBehavior.floating,
    ));
  }

  Future<void> loginUser(String emailUser, String passworduser) async {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailUser, password: passworduser);
  }

  Future<UserCredential> signInWIthGoogle()async{
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  
}
