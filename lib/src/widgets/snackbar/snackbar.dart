import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
// TODO replace to https://pub.dev/packages/bot_toast

class XSnackBar {
// TODO replace to https://pub.dev/packages/bot_toast
  static show({required String msg}) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: MyColors.colorPrimary,
      textColor: MyColors.colorWhite,
      fontSize: 16.0);
  // TODO: show full screen loading
  // TODO: hide full screen loading
}
