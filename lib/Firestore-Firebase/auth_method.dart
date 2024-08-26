import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/Models/User_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authmethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> Sign_up(String name, String email, String pass) async {
    String? rs = 'error';
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      UserData user = UserData(
        id: userCredential.user!.uid,
        Name: name,
        email: email,
      );
      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(user.toMap());
      rs = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      rs = e.code;
    } catch (e) {
      print(e);
      rs = e.toString();
    }
    return rs;
  }

  Future<String> sign_in(String email, String pass) async {
    String rs = 'error';
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      rs = 'success';
    } on FirebaseAuthException catch (e) {
      rs = e.code;
      print(e.code);
    }
    return rs;
  }

  Future<UserData> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return UserData.fromSnap(snap);
  }
}
