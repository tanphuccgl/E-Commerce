import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/user_model.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final ref = FirebaseFirestore.instance.collection('User');

Future<void> createUser(User user) async {
  ref
      .add(user.toJson())
      .then((value) => XSnackBar.show(msg: "User Added"))
      .catchError((error) => XSnackBar.show(msg: "Failed to add user: $error"));
}

Future<void> getUser() async {
  ref
      .doc("lQlr8u7gkvO8x2j2JYju")
      .get()
      .then((value) => XSnackBar.show(msg: value.data().toString()))
      .catchError((error) => XSnackBar.show(msg: "Failed to get user: $error"));
}

Future<void> uploadImage() async {
  final ImagePicker _picker = ImagePicker();
  late File imageFile;
  XFile? image = await _picker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (image != null) {
    imageFile = File(image.path);
  }

  await firebase_storage.FirebaseStorage.instance
      .ref('uploads/${image != null ? image.name : "N/A"}')
      .putFile(imageFile)
      .then((p0) => XSnackBar.show(msg: "Uploaded image"))
      .onError((error, stackTrace) =>
          XSnackBar.show(msg: "Failed to upload image: $error"));
}

Future<void> getUrlImage() async {
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref()
      .child("uploads/scaled_image_picker8182173382717439531.png");

  String url = (await ref.getDownloadURL()).toString();
  log(url);
  XSnackBar.show(msg: "iamge Url: $url");
}
