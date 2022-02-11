import 'dart:io';

import 'package:e_commerce/_dev/firebase_func.dart';
import 'package:e_commerce/_dev/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   (!Platform.isWindows) ? await Firebase.initializeApp() : null;
 

  group('Create User', () {
    User phuc = User(name: "levi", age: 21, sex: 0);
    test('phuc, 21,0', () {
      expect(createUser(phuc), "User Added");
    });
  });
}
