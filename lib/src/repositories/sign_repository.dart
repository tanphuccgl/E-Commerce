import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final ref = FirebaseFirestore.instance.collection('User');

abstract class SignRepository {
  Future<UserModel> loginWithEmail(
      {required String email, required String password});
  Future<void> signUp(
      {required String email, required String password, required String name});
  Future<UserModel> loginWithGoogle();
}

class SignRepositoryImpl implements SignRepository {
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
  Future<UserModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await auth.signInWithCredential(credential);

    var success = UserModel.fromJson(
        {"name": googleUser!.displayName, "email": googleUser.email});
    ref.doc(userCredential.user?.uid).set(
        UserModel(email: googleUser.displayName, name: googleUser.email)
            .toJson());

    return success;
  }

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
