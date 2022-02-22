import 'package:bot_toast/bot_toast.dart';

class XSnackBar {
  static late CancelFunc cancel;

  static show({required String msg}) => BotToast.showText(text: msg);
  static showLoading() => cancel = BotToast.showLoading();
  static hideLoading() {
    cancel();
  }
}
