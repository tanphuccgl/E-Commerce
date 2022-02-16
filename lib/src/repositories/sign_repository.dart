import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/user_model.dart';
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
  Future<UserModel> loginWithEmail(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    var value = await ref.doc(userCredential.user?.uid).get();
    var success = UserModel.fromJson(value.data()!);
    return success;
  }

  @override
  Future<void> loginWithGoogle() async {}

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    ref
        .doc(userCredential.user?.uid)
        .set(UserModel(email: email, name: name).toJson());
  }
}
