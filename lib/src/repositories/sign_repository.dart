// ignore_for_file: no_duplicate_case_values

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
final ref =
    FirebaseFirestore.instance.collection('User').withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (userModel, _) => userModel.toJson(),
        );

abstract class SignRepository {
  // TODO
  Future<XResult<UserModel>> loginWithEmail(
      {required String email, required String password});
  // TODO
  Future<XResult<UserModel>> signUp(
      {required String email, required String password, required String name});
  // TODO
  Future<XResult<UserModel>> loginWithGoogle();
  // TODO
  Future<XResult> logout();
}

class SignRepositoryImpl implements SignRepository {
  Future<bool> userReadlyExists(String email) async =>
      (await ref.where("email", isEqualTo: email).get()).docs.isEmpty;

  @override
  Future<void> loginWithEmail(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await auth.signInWithCredential(credential);

    if (await userReadlyExists(googleUser!.email)) {
      ref.doc(userCredential.user?.uid).set(
          UserModel(email: googleUser.email, name: googleUser.displayName));
    }
  }

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (userCredential.user != null) {
      ref
          .doc(userCredential.user?.uid)
          .set(UserModel(email: email, name: name));
    }
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }

  @override
  Future<String> handleError({required String codeError}) {
    switch (codeError) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return Future.value("Email already used. Go to login page.");

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return Future.value("Wrong email/password combination.");

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return Future.value("No user found with this email.");

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return Future.value("User disabled.");
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return Future.value("Too many requests to log into this account.");

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return Future.value("Server error, please try again later.");

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return Future.value("Email address is invalid.");

      default:
        return Future.value("Login failed. Please try again.");
    }
  }
}
