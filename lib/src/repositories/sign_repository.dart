import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final ref = FirebaseFirestore.instance.collection('User');

abstract class SignRepository {
  Future<void> loginWithEmail(
      {required String email, required String password});
  Future<void> signUp(
      {required String email, required String password, required String name});
  Future<void> loginWithGoogle();
  // forgot password
}

class SignrepositoryImpl implements SignRepository {
  @override
  Future<void> loginWithEmail(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> loginWithGoogle() async {}

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);

    ref
        .add({"name": name, "email": email})
        .then((value) => log("User Added"))
        .catchError((error) => log(error));
  }
}
