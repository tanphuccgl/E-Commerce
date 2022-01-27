import 'package:e_commerce/src/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType {
  info,
  error,
  success,
  warn,
}
class XSnackBar{
   static show({required String msg})=> Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.colorPrimary,
        textColor: Colors.white,
        fontSize: 16.0
    );
}