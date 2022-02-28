import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/categories_model.dart';

Future<void> addCategories() {
  CollectionReference value =
      FirebaseFirestore.instance.collection('Categories');
  List<XCategories> list = [
    XCategories(id: 1, name: 'Tops'),
    XCategories(id: 2, name: 'Shirts & Blouses'),
    XCategories(id: 3, name: 'Cardigans & Sweaters'),
    XCategories(id: 4, name: 'Knitwear'),
    XCategories(id: 5, name: 'Blazers'),
    XCategories(id: 6, name: 'Outerwear'),
    XCategories(id: 7, name: 'Pants'),
    XCategories(id: 8, name: 'Jeans'),
    XCategories(id: 9, name: 'Shorts'),
    XCategories(id: 10, name: 'Skirts'),
    XCategories(id: 11, name: 'Dresses'),
  ];
  for (int i = 0; i < list.length; i++) {
    value
        .add({
          "id": list[i].id,
          "name": list[i].name,
        })
        .then((value) => log(" Added"))
        .catchError((error) => log("Failed to add : $error"));
  }
  return Future.value();
}
// Future<void> updateProduct() {
//   CollectionReference value =
//       FirebaseFirestore.instance.collection('Categories');
//   List<XCategories> list = [
//     XCategories(id: 1, name: 'Tops'),
//     XCategories(id: 2, name: 'Shirts & Blouses'),
//     XCategories(id: 3, name: 'Cardigans & Sweaters'),
//     XCategories(id: 4, name: 'Knitwear'),
//     XCategories(id: 5, name: 'Blazers'),
//     XCategories(id: 6, name: 'Outerwear'),
//     XCategories(id: 7, name: 'Pants'),
//     XCategories(id: 8, name: 'Jeans'),
//     XCategories(id: 9, name: 'Shorts'),
//     XCategories(id: 10, name: 'Skirts'),
//     XCategories(id: 11, name: 'Dresses'),
//   ];
//   for (int i = 0; i < list.length; i++) {
//     value
//         .add({
//           "id": list[i].id,
//           "name": list[i].name,
//         })
//         .then((value) => log(" Added"))
//         .catchError((error) => log("Failed to add : $error"));
//   }
//   return Future.value();
// }
