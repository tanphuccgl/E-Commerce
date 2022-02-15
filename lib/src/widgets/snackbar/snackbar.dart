import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType {
  info,
  error,
  success,
  warn,
}

class XSnackBar {
  static show({required String msg}) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: MyColors.colorPrimary,
      textColor: MyColors.colorWhite,
      fontSize: 16.0);
}
