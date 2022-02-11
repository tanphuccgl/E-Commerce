import 'package:e_commerce/_dev/firebase_func.dart';
import 'package:e_commerce/_dev/user_model.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User levi = User(name: "levi", age: 21, sex: 0);
    const title = "Home";
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            XButton(
                label: "create User",
                onPressed: () {
                  createUser(levi);
                }),
            XButton(
                label: "Get User",
                onPressed: () {
                  getUser();
                }),
            XButton(
                label: "upload iamge",
                onPressed: () {
                  uploadImage();
                }),
            XButton(
                label: "get image url by path",
                onPressed: () {
                  getUrlImage();
                })
          ],
        ),
      ),
    );
  }
}
