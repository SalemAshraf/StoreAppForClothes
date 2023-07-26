import 'package:firebase_auth/firebase_auth.dart';

class HomeScreenViewModel {
  signOut() async {
    var auth = FirebaseAuth.instance;
    await auth.signOut();
  }
}
