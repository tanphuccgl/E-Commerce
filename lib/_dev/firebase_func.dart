import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/data_firebase.dart';
import 'package:e_commerce/src/models/products_model.dart';

Future<void> addCategories() {
  CollectionReference value =
      FirebaseFirestore.instance.collection('Categories');

  for (int i = 0; i < listCategories.length; i++) {
    value
        .doc(listCategories[i].id)
        .set({
          "id": listCategories[i].id,
          "name": listCategories[i].name,
        })
        .then((value) => log(" Added"))
        .catchError((error) => log("Failed to add : $error"));
  }
  return Future.value();
}

Future<void> fetchProduct() async {
  final ref =
      FirebaseFirestore.instance.collection('Product').withConverter<XProduct>(
            fromFirestore: (snapshot, _) => XProduct.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
  QuerySnapshot<XProduct> query = await ref.get();
  for (var item in query.docs) {
    log(jsonEncode(item.data()));
  }
}

Future<void> setProduct() async {
  final ref =
      FirebaseFirestore.instance.collection('Product').withConverter<XProduct>(
            fromFirestore: (snapshot, _) => XProduct.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );

  for (int i = 0; i < listProduct.length; i++) {
    ref.doc(listProduct[i].id).set(listProduct[i], SetOptions(merge: true));
  }
}
