import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final ref = FirebaseFirestore.instance.collection('User');

abstract class SignRepository {
  Future<void> loginWithEmail(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> loginWithGoogle();
  // forgot password
}

class SignrepositoryImpl implements SignRepository {
  @override
  Future<User> loginWithEmail(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return 
  }

  @override
  Future<void> loginWithGoogle() async {}

  @override
  Future<bool> signUp(String email, String password,String name) async {
   await auth.createUserWithEmailAndPassword(email: email, password: password);
   UserModel user=UserModel();
    ref
      .add(user.toJson())
      .then((value) => XSnackBar.show(msg: "User Added"))
      .catchError((error) => XSnackBar.show(msg: "Failed to add user: $error"));

  }
}
